-- =========================================================
-- Screen
-- =========================================================

-- Root-level UI surface that covers the whole screen.

local ui_helpers = require("ui_helpers")

local M = {}

function M.init(ui_utils)
	M.ui_utils = ui_utils
end

M.Screen = {}
M.Screen.__index = M.Screen
M.Screen.defaults = {
	x = 0, y = 0,
	min_w = 1, min_h = 1,
	rel_w = nil, rel_h = nil,
	max_w = djui_hud_get_screen_width(),
	max_h = djui_hud_get_screen_height(),
	padding_x = 0, padding_y = 0,
	fill_mode = "fill",
}

function M.Screen:get_min_size(defaults, arg_params)
	return ui_helpers.base_get_min_size(self, defaults, arg_params)
end

function M.Screen:render(arg_params)
	local params = ui_helpers.merge_params(self.defaults, self.arg_params, arg_params)

	-- Make sure the screen is at least as big as its children require.
	local req_w, req_h = self:get_min_size(self.defaults, arg_params)
	params.min_w = math.max(params.min_w or 0, req_w)
	params.min_h = math.max(params.min_h or 0, req_h)

	ui_helpers.resolve_position(params)

	-- Screen padding creates an inset area for children.
	params.x = params.x + params.padding_x
	params.y = params.y + params.padding_y
	params.max_w = params.max_w - params.padding_x * 2
	params.max_h = params.max_h - params.padding_y * 2

	-- Render all children inside the screen.
	for _, child in ipairs(self.children or {}) do
		child:render(child.arg_params, params)
	end
end

return M
