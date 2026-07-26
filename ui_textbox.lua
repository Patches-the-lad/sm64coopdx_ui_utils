-- =========================================================
-- TextBox
-- =========================================================

-- Panel with built-in text rendering.

local ui_helpers = require("ui_helpers")

local M = {}

function M.init(ui_utils)
	M.ui_utils = ui_utils
end


M.TextBox = {}
M.TextBox.__index = M.TextBox
M.TextBox.defaults = {
	x_offset = 0, y_offset = 0,
	min_w = 1, min_h = 1,
	padding_x = 10, padding_y = 10,
	anchor_x = 0, anchor_y = 0,
	fill_mode = "fill",

	panel_color = {r = 0, g = 0, b = 0, a = 127},

	draw_border = true,
	border_color = {r = 255, g = 255, b = 255, a = 255},
	border_thickness = 3,

	text = "default text",
	text_scale = 1,
	text_color = { r = 255, g = 255, b = 255, a = 255 },

	-- Shadow Settings
	use_shadow = true,
	shadow_color = { r = 0, g = 0, b = 0, a = 150 },
	shadow_offset_x = 2,
	shadow_offset_y = 2,

	font = 3,
	text_padding_x = 10,
	text_padding_y = 10,
	word_wrap = true,
	char_wrap = true,
	line_spacing = 1.0,
	w_align = 0,
	h_align = 0,
}

function M.TextBox:get_min_size(defaults, arg_params)
	return ui_helpers.base_get_min_size(self, defaults, arg_params)
end

function M.TextBox:render(arg_params, parent_params)
	local params = ui_helpers.merge_params(self.defaults, parent_params, arg_params)

	local req_w, req_h = self:get_min_size(self.defaults, arg_params)
	params.min_w = math.max(params.min_w or 0, req_w)
	params.min_h = math.max(params.min_h or 0, req_h)

	ui_helpers.resolve_position(params)

	-- Background panel.
	djui_hud_set_color(params.panel_color.r, params.panel_color.g, params.panel_color.b, params.panel_color.a)
	djui_hud_render_rect(params.x + params.x_offset, params.y + params.y_offset, params.max_w, params.max_h)

	if params.draw_border then
		-- Draw panel border.
		djui_hud_set_color(params.border_color.r, params.border_color.g, params.border_color.b, params.border_color.a)
		ui_helpers.render_border_lines(params.x + params.x_offset, params.y + params.y_offset, params.max_w, params.max_h, params.border_thickness)
	end

	-- Text content.
	local s_color = params.use_shadow and params.shadow_color or nil

	ui_helpers.render_text_lines(
		params.text,
		params.text_scale,
		params.font,
		params.word_wrap,
		params.char_wrap,
		params.w_align,
		params.h_align,
		params.line_spacing,
		params.text_padding_x,
		params.text_padding_y,
		params.max_w,
		params.max_h,
		params.x + params.x_offset,
		params.y + params.y_offset,
		params.text_color,
		s_color,
		params.shadow_offset_x,
		params.shadow_offset_y
	)

	-- Leave layout values intact for children.
	params.x = params.x + params.padding_x
	params.y = params.y + params.padding_y
	params.max_w = params.max_w - params.padding_x * 2
	params.max_h = params.max_h - params.padding_y * 2

	-- While a textbox can have children, it is not recommended.
	for _, child in ipairs(self.children or {}) do
		child:render(child.arg_params, params)
	end
end

return M
