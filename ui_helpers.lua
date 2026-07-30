-- =========================================================
-- Helper functions
-- =========================================================

local M = {}

-- Merge any number of parameter tables into one.
-- Later tables override earlier ones.
function M.merge_params(...)
	local result = {}
	for i = 1, select("#", ...) do
		local t = select(i, ...)
		if t then
			for k, v in pairs(t) do
				result[k] = v
			end
		end
	end
	return result
end

-- Resolve actual size and position based on:
-- - min/max bounds
-- - relative sizing
-- - fill mode
-- - anchor offsets
-- - manual x/y offsets
function M.resolve_position(params)
	-- Identify the Available Space (from parent)
	local parent_w = params.max_w or 0
	local parent_h = params.max_h or 0

	-- Calculate the "Ceiling"
	local ceiling_w = parent_w
	if params.rel_w then
		ceiling_w = parent_w * params.rel_w
	end

	local ceiling_h = parent_h
	if params.rel_h then
		ceiling_h = parent_h * params.rel_h
	end

	-- Determine the Desired Size based on Fill Mode
	local desired_w = params.min_w or 0
	local desired_h = params.min_h or 0

	if params.fill_mode == "fill" then
		desired_w = ceiling_w
		desired_h = ceiling_h
	elseif params.fill_mode == "w_fill" then
		desired_w = ceiling_w
	elseif params.fill_mode == "h_fill" then
		desired_h = ceiling_h
	end

	-- Final Clamp: Result must be between min and the relative ceiling
	local actual_w = math.max(params.min_w or 0, math.min(desired_w, ceiling_w))
	local actual_h = math.max(params.min_h or 0, math.min(desired_h, ceiling_h))

	-- Calculate Position based on Parent's space (not the object's size)
	local anchor_x = params.anchor_x or 0
	local anchor_y = params.anchor_y or 0
	local offset_x = params.x_offset or 0
	local offset_y = params.y_offset or 0

	-- Anchor calculation: (Parent Space - Object Size) * anchor_factor
	-- This centers the object if anchor is 0.5, or puts it at the end if 1.0
	params.x = params.x + (anchor_x * (parent_w - actual_w)) + offset_x
	params.y = params.y + (anchor_y * (parent_h - actual_h)) + offset_y

	-- Update params for the render functions and children
	-- Now max_w actually means "the width of this object"
	params.max_w = actual_w
	params.max_h = actual_h
end


-- Shared min-size logic for containers that size themselves from children.
function M.base_get_min_size(self, defaults, arg_params)
	local params = M.merge_params(defaults, arg_params)
	local min_w = params.min_w or 0
	local min_h = params.min_h or 0

	-- A parent must be large enough to fit its largest child.
	for _, child in ipairs(self.children or {}) do
		local child_w, child_h = child:get_min_size(child.defaults, child.arg_params)
		min_w = math.max(min_w, child_w)
		min_h = math.max(min_h, child_h)
	end

	return min_w, min_h
end

-- Draws a simple rectangle using lines
function M.render_border_lines(x, y, w, h, thickness)
	-- Trust me these calculations look dumb, but they work
	local t = thickness / 2
	djui_hud_render_line(x+w, y, x+w, y+h-t-t, thickness)
	djui_hud_render_line(x+w+t, y+h-t, x-t, y+h-t, thickness)
	djui_hud_render_line(x, y+h-t-t, x, y, thickness)
	djui_hud_render_line(x-t, y-t, x+w+t, y-t, thickness)
end

-- Text rendering helper
-- Draw text with optional wrapping and line splitting.
function M.render_text_lines(text, text_scale, font, word_wrap, char_wrap, h_align, v_align, line_spacing, pad_x, pad_y, max_w, max_h, x, y, main_color, shadow_color, shadow_offset_x, shadow_offset_y)
	if not text or text == "" then return end

	djui_hud_set_font(font)
	djui_hud_set_text_alignment(h_align, 0) -- Horizontal alignment works almost out of the box. Vertical alignment has to be manually done.

	local available_w = max_w - (pad_x * 2)

	-- 1. Pre-process all text into a final list of lines
	local final_lines = {}
	local manual_lines = {}
	for line in text:gmatch("([^\n]*)\n?") do
		table.insert(manual_lines, line)
	end
	if manual_lines[#manual_lines] == "" then table.remove(manual_lines) end

	-- This part had significant help from AI.
	-- Handles word and character wrapping.
	for _, line in ipairs(manual_lines) do
		if word_wrap or char_wrap then
			local current_line = ""
			for word in line:gmatch("%S+%s*") do
				local test_line = current_line .. word
				local w, _ = djui_hud_measure_text(test_line)

				if (w * text_scale) <= available_w then
					current_line = test_line
				else
					if current_line ~= "" then
						table.insert(final_lines, current_line)
						current_line = ""
					end
					local word_w, _ = djui_hud_measure_text(word)
					if (word_w * text_scale) > available_w and char_wrap then
						local char_line = ""
						for i = 1, #word do
							local char = word:sub(i, i)
							local char_test = char_line .. char
							local cw, _ = djui_hud_measure_text(char_test)
							if (cw * text_scale) <= available_w then
								char_line = char_test
							else
								table.insert(final_lines, char_line)
								char_line = char
							end
						end
						current_line = char_line
					else
						current_line = word
					end
				end
			end
			table.insert(final_lines, current_line)
		else
			table.insert(final_lines, line)
		end
	end

	-- 2. Calculate total block height and store individual line heights
	local total_block_height = 0
	local line_heights = {}
	for i, line in ipairs(final_lines) do
		local _, h = djui_hud_measure_text(line)
		local scaled_h = h * text_scale
		table.insert(line_heights, scaled_h)    -- Only add spacing between lines, not after the last line
		if i < #final_lines then
			total_block_height = total_block_height + (scaled_h * line_spacing)
		else
			total_block_height = total_block_height + scaled_h
		end
	end

		-- 3. Determine the "Ideal" start Y using linear interpolation
	local top_y = y + pad_y
	local bottom_y = y + max_h - pad_y - total_block_height

	-- v_align = 0 is top, 1 is bottom.
	-- This allows for smooth transitions and fixes the runtime update bug.
	local current_y = top_y + (bottom_y - top_y) * v_align


	-- 4. Calculate Horizontal Position
	local current_x = x + pad_x + (h_align * (max_w - 2 * pad_x))
	local top_boundary = y + pad_y
	local bottom_boundary = y + max_h - pad_y

	-- 5. Render Loop with strict boundary clipping
	for i = 1, #final_lines do
		local line_text = final_lines[i]
		local scaled_h = line_heights[i]
		local line_bottom = current_y + scaled_h

		-- CLIP TOP: If the TOP of the line is above the top padding, skip it.
		-- Previously you checked line_bottom, which allowed the top to spill over.
		if current_y < top_boundary then
			current_y = current_y + (scaled_h * line_spacing)
		elseif line_bottom > bottom_boundary then
			-- CLIP BOTTOM: If the bottom of the line exceeds the bottom padding, stop.
			break
		else
			-- Render Shadow
			if shadow_color then
				djui_hud_set_color(shadow_color.r, shadow_color.g, shadow_color.b, shadow_color.a)
				djui_hud_print_text(line_text, current_x + shadow_offset_x, current_y + shadow_offset_y, text_scale)
			end

			-- Render Main Text
			djui_hud_set_color(main_color.r, main_color.g, main_color.b, main_color.a)
			djui_hud_print_text(line_text, current_x, current_y, text_scale)

			current_y = current_y + (scaled_h * line_spacing)
		end
	end
end

return M
