-- =========================================================
-- Grid (Dynamic Sizing)
-- =========================================================

local ui_helpers = require("ui_helpers")

local M = {}

function M.init(ui_utils)
	M.ui_utils = ui_utils
end

M.Grid = {}
M.Grid.__index = M.Grid
M.Grid.defaults = {
	x_offset = 0, y_offset = 0,
	min_w = 1, min_h = 1,
	padding_x = 10, padding_y = 10,
	spacing_x = 5,
	spacing_y = 5,
	rows = 1,
	cols = 1,
	anchor_x = 0, anchor_y = 0,
	fill_mode = "fill",
}

-- Helper to calculate the required widths for each column and heights for each row
function M.Grid:_calculate_grid_dimensions(params)
	local rows = params.rows or 1
	local cols = params.cols or 1
	local children = self.children or {}

	local col_widths = {}
	local row_heights = {}
	for i = 1, cols do col_widths[i] = 0 end
	for i = 1, rows do row_heights[i] = 0 end

	for i, child in ipairs(children) do
		if i > (rows * cols) then break end

		local col = ((i - 1) % cols) + 1
		local row = math.floor((i - 1) / cols) + 1

		local cw, ch = child:get_min_size(child.defaults, child.arg_params)
		col_widths[col] = math.max(col_widths[col], cw)
		row_heights[row] = math.max(row_heights[row], ch)
	end

	return col_widths, row_heights
end

function M.Grid:get_min_size(defaults, arg_params)
	local params = ui_helpers.merge_params(defaults, arg_params)
	local col_widths, row_heights = self:_calculate_grid_dimensions(params)

	local total_w = 0
	for _, w in ipairs(col_widths) do total_w = total_w + w end
	total_w = total_w + (math.max(0, params.cols - 1) * (params.spacing_x or 0))

	local total_h = 0
	for _, h in ipairs(row_heights) do total_h = total_h + h end
	total_h = total_h + (math.max(0, params.rows - 1) * (params.spacing_y or 0))

	return math.max(params.min_w or 0, total_w), math.max(params.min_h or 0, total_h)
end

function M.Grid:render(arg_params, parent_params)
	local params = ui_helpers.merge_params(self.defaults, parent_params, arg_params)

	local req_w, req_h = self:get_min_size(self.defaults, arg_params)
	params.min_w = math.max(params.min_w or 0, req_w)
	params.min_h = math.max(params.min_h or 0, req_h)

	ui_helpers.resolve_position(params)

	local available_w = params.max_w - (params.padding_x * 2)
	local available_h = params.max_h - (params.padding_y * 2)

	local col_widths, row_heights = self:_calculate_grid_dimensions(params)
	local children = self.children or {}
	if #children == 0 then return end

	-- Calculate total required size for distribution
	local min_total_w = 0
	for _, w in ipairs(col_widths) do min_total_w = min_total_w + w end
	local min_total_h = 0
	for _, h in ipairs(row_heights) do min_total_h = min_total_h + h end

	-- Calculate extra space to distribute if the grid is filling
	-- We subtract spacing from available space before distributing
	local spacing_w = (math.max(0, params.cols - 1) * (params.spacing_x or 0))
	local spacing_h = (math.max(0, params.rows - 1) * (params.spacing_y or 0))

	local extra_w = available_w - min_total_w - spacing_w
	local extra_h = available_h - min_total_h - spacing_h

	-- Resolve final column widths (distributed extra space evenly among columns)
	local final_col_widths = {}
	for i = 1, #col_widths do
		local addition = (extra_w > 0) and (extra_w / #col_widths) or 0
		final_col_widths[i] = col_widths[i] + addition
	end

	-- Resolve final row heights (distributed extra space evenly among rows)
	local final_row_heights = {}
	for i = 1, #row_heights do
		local addition = (extra_h > 0) and (extra_h / #row_heights) or 0
		final_row_heights[i] = row_heights[i] + addition
	end

	for i, child in ipairs(children) do
		if i > (params.rows * params.cols) then break end

		local col = ((i - 1) % params.cols) + 1
		local row = math.floor((i - 1) / params.cols) + 1

		-- Calculate X position by summing widths of all columns to the left
		local cell_x = params.x + params.padding_x
		for c = 1, col - 1 do
			cell_x = cell_x + final_col_widths[c] + (params.spacing_x or 0)
		end

		-- Calculate Y position by summing heights of all rows above
		local cell_y = params.y + params.padding_y
		for r = 1, row - 1 do
			cell_y = cell_y + final_row_heights[r] + (params.spacing_y or 0)
		end

		child:render(child.arg_params, {
			max_w = final_col_widths[col],
			max_h = final_row_heights[row],
			x = cell_x,
			y = cell_y,
		})
	end
end

return M
