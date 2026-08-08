-- =========================================================
-- HStack
-- =========================================================

-- Lay children out horizontally.
-- Fixed-width children keep their minimum width.
-- Fill children share remaining width.

local ui_helpers = require("ui_helpers")

local M = {}

function M.init(ui_utils)
	M.ui_utils = ui_utils
end

M.HStack = {}
M.HStack.__index = M.HStack
M.HStack.defaults = {
	render = true,
	x_offset = 0, y_offset = 0,
	min_w = 1, min_h = 1,
	rel_w = nil, rel_h = nil,
	padding_x = 10, padding_y = 10,
	spacing_x = 5,
	anchor_x = 0, anchor_y = 0,
	fill_mode = "fill",
}

function M.HStack:get_min_size(defaults, arg_params)
	local params = ui_helpers.merge_params(defaults, arg_params)
	local total_w = params.min_w or 0
	local max_h = params.min_h or 0
	local children = self.children or {}
	local children_width = 0

	for _, child in ipairs(children) do
		local cw, ch = child:get_min_size(child.defaults, child.arg_params)
		children_width = children_width + cw
		max_h = math.max(max_h, ch)
	end

	if #children > 0 then
		total_w = math.max(total_w, children_width + (#children - 1) * (params.spacing_x or 0))
	end

	return total_w, max_h
end

function M.HStack:render(arg_params, parent_params)
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
	local total_fixed_w = 0
	local fillable_count = 0
	local total_spacing = math.max(0, #children - 1) * (params.spacing_x or 0)

	for i, child in ipairs(children) do
		local cw, _ = child:get_min_size(child.defaults, child.arg_params)
		local cp = ui_helpers.merge_params(child.defaults, child.arg_params)
		child_data[i] = { cw = cw, cp = cp }

		if cp.fill_mode == "w_fill" or cp.fill_mode == "fill" then
			fillable_count = fillable_count + 1
		else
			total_fixed_w = total_fixed_w + cw
		end
	end

	local remaining_w = available_w - total_fixed_w - total_spacing
	local current_x = params.x + params.padding_x

	for i, child in ipairs(children) do
		local data = child_data[i]
		local final_w = data.cw
		local cp = data.cp

		if (cp.fill_mode == "w_fill" or cp.fill_mode == "fill") and fillable_count > 0 then
			if remaining_w > 0 then
				local even_width = (available_w - total_fixed_w - total_spacing) / fillable_count
				final_w = math.max(data.cw, even_width)
			else
				final_w = data.cw
			end
		end

		-- Pass the merged 'params' so children inherit the style context
		child:render(child.arg_params, ui_helpers.merge_params(params, {
			max_w = final_w,
			max_h = available_h,
			x = current_x,
			y = params.y + params.padding_y,
		}))

		current_x = current_x + final_w + (params.spacing_x or 0)
	end
end

return M
