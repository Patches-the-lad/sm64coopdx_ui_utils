-- =========================================================
-- Texture
-- =========================================================

-- Texture = container + rendered image background.

local ui_helpers = require("ui_helpers")

local M = {}

function M.init(ui_utils)
	M.ui_utils = ui_utils
end

M.Texture = {}
M.Texture.__index = M.Texture
M.Texture.defaults = {
	x_offset = 0, y_offset = 0,
	min_w = 1, min_h = 1,
	rel_w = nil, rel_h = nil,
	padding_x = 0, padding_y = 0,
	anchor_x = 0, anchor_y = 0,
	fill_mode = "fill",
	tex_info = nil,
	base_size = 256,
	draw_border = false,
	border_color = {r = 255, g = 255, b = 255, a = 255},
	border_thickness = 3,
}

function M.Texture:get_min_size(defaults, arg_params)
	return ui_helpers.base_get_min_size(self, defaults, arg_params)
end

function M.Texture:render(arg_params, parent_params)
	local params = ui_helpers.merge_params(self.defaults, parent_params, arg_params)

	-- Ensure texture is large enough for all children
	local req_w, req_h = self:get_min_size(self.defaults, arg_params)
	params.min_w = math.max(params.min_w or 0, req_w)
	params.min_h = math.max(params.min_h or 0, req_h)

	ui_helpers.resolve_position(params)

	-- Calculate scale based on the resolved size and the original POT size
	local scaleW = params.max_w / params.base_size
	local scaleH = params.max_h / params.base_size

	-- Draw the texture
	if params.tex_info then
		djui_hud_render_texture(
			params.tex_info,
			params.x + params.x_offset,
			params.y + params.y_offset,
			scaleW,
			scaleH
		)
	end

	if params.draw_border then
		-- Draw texture border
		djui_hud_set_color(params.border_color.r, params.border_color.g, params.border_color.b, params.border_color.a)
		ui_helpers.render_border_lines(params.x + params.x_offset, params.y + params.y_offset, params.max_w, params.max_h, params.border_thickness)
	end

	-- Child area inside the texture
	params.x = params.x + params.padding_x
	params.y = params.y + params.padding_y
	params.max_w = params.max_w - params.padding_x * 2
	params.max_h = params.max_h - params.padding_y * 2

	for _, child in ipairs(self.children or {}) do
		child:render(child.arg_params, params)
	end
end

return M
