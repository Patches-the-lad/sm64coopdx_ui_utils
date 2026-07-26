-- =========================================================
-- Container
-- =========================================================

-- Generic layout container.
-- It sizes to fit its children, applies padding, and renders them.
-- Use this as a template for all future objects.

local ui_helpers = require("ui_helpers")

local M = {}

function M.init(ui_utils)
	M.ui_utils = ui_utils
end

M.Container = {}
M.Container.__index = M.Container
M.Container.defaults = {
	min_w = 1, min_h = 1,
	padding_x = 10, padding_y = 10,
	anchor_x = 0, anchor_y = 0,
	fill_mode = "fill",
}

function M.Container:get_min_size(defaults, arg_params)
	return ui_helpers.base_get_min_size(self, defaults, arg_params)
end

function M.Container:render(arg_params, parent_params)
	local params = ui_helpers.merge_params(self.defaults, parent_params, arg_params)

	local req_w, req_h = self:get_min_size(self.defaults, arg_params)
	params.min_w = math.max(params.min_w or 0, req_w)
	params.min_h = math.max(params.min_h or 0, req_h)

	ui_helpers.resolve_position(params)

	-- Inner content area after padding.
	params.x = params.x + params.padding_x
	params.y = params.y + params.padding_y
	params.max_w = params.max_w - params.padding_x * 2
	params.max_h = params.max_h - params.padding_y * 2

	for _, child in ipairs(self.children or {}) do
		child:render(child.arg_params, params)
	end
end

return M
