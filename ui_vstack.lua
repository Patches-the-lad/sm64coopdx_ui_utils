-- =========================================================
-- VStack
-- =========================================================

-- Lay children out vertically.
-- Fixed-height children keep their minimum height.
-- Fill children share remaining height.

local ui_helpers = require("ui_helpers")

local M = {}

function M.init(ui_utils)
	M.ui_utils = ui_utils
end

M.VStack = {}
M.VStack.__index = M.VStack
M.VStack.defaults = {
	render = true,
	x_offset = 0, y_offset = 0,
	min_w = 1, min_h = 1,
	rel_w = nil, rel_h = nil,
	padding_x = 10, padding_y = 10,
	spacing_y = 5,
	anchor_x = 0, anchor_y = 0,
	fill_mode = "fill",
}

function M.VStack:get_min_size(defaults, arg_params)
	local params = ui_helpers.merge_params(defaults, arg_params)
	local total_h = params.min_h or 0
	local max_w = params.min_w or 0
	local children = self.children or {}
	local children_height = 0

	for _, child in ipairs(children) do
		local cw, ch = child:get_min_size(child.defaults, child.arg_params)
		children_height = children_height + ch
		max_w = math.max(max_w, cw)
	end

	if #children > 0 then
		total_h = math.max(total_h, children_height + (#children - 1) * (params.spacing_y or 0))
	end

	return max_w, total_h
end

function M.VStack:render(arg_params, parent_params)
	local params = ui_helpers.merge_params(self.defaults, parent_params, arg_params)

	local req_w, req_h = self:get_min_size(self.defaults, arg_params)
	params.min_w = math.max(params.min_w or 0, req_w)
	params.min_h = math.max(params.min_h or 0, req_h)

	ui_helpers.resolve_position(params)

	local available_w = params.max_w - params.padding_x * 2
	local available_h = params.max_h - params.padding_y * 2
	local children = self.children or {}
	if #children == 0 then return end

	local child_data = {}
	local total_fixed_h = 0
	local fillable_count = 0
	local total_spacing = math.max(0, #children - 1) * (params.spacing_y or 0)

	for i, child in ipairs(children) do
		local _, ch = child:get_min_size(child.defaults, child.arg_params)
		local cp = ui_helpers.merge_params(child.defaults, child.arg_params)
		child_data[i] = { ch = ch, cp = cp }

		if cp.fill_mode == "h_fill" or cp.fill_mode == "fill" then
			fillable_count = fillable_count + 1
		else
			total_fixed_h = total_fixed_h + ch
		end
	end

	local remaining_h = available_h - total_fixed_h - total_spacing
	local current_y = params.y + params.padding_y

	for i, child in ipairs(children) do
		local data = child_data[i]
		local final_h = data.ch

		if (data.cp.fill_mode == "h_fill" or data.cp.fill_mode == "fill") and fillable_count > 0 then
			if remaining_h > 0 then
				local even_height = (available_h - total_fixed_h - total_spacing) / fillable_count
				final_h = math.max(data.ch, even_height)
			else
				final_h = data.ch
			end
		end

		-- Pass the merged 'params' so children inherit the style context
		child:render(child.arg_params, ui_helpers.merge_params(params, {
			max_w = available_w,
			max_h = final_h,
			x = params.x + params.padding_x,
			y = current_y,
		}))

		current_y = current_y + final_h + (params.spacing_y or 0)
	end
end

return M
