-- name: UI Utils Test
-- description: This is a test of the UI

-- Main

local M = {}

local test_text = "This is a test! This test is very POGGIES! ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ Aa Bb Cc Dd Ee Ff Gg Hh Ii Jj Kk Ll Mm Nn Oo Pp Qq Rr Ss Tt Uu Vv Ww Xx Yy Zz 1 2 3 4 5 6 7 8 9 0 , . / ; ' [ ] \\ - = < > ? : \" { } | _ + ! @ # $ % ^ & * ( ) \n New Line \n\n Double New Line"

local screen = {}

local test_v = {}
local test_h = {}
local test_grid = {}

local test_panel_1 = {}
local test_panel_2 = {}
local test_panel_3 = {}
local test_panel_4 = {}
local test_panel_5 = {}
local test_panel_6 = {}

local test_var_1 = 0
local test_var_2 = 0

function M.init()
	M.ui_utils = require("ui_utils")

	screen = M.ui_utils.create_screen()

	test_v = M.ui_utils.create_v_stack({fill_mode = "no_fill", padding_x = 0, padding_y = 0, min_w = 800, min_h = 800, spacing_y = 10})
	test_h = M.ui_utils.create_h_stack({fill_mode = "fill", padding_x = 0, padding_y = 0, min_w = 300, spacing_x = 10})

	test_grid = M.ui_utils.create_grid({fill_mode = "no_fill", rows = 2, cols = 2})
	-- Blue textbox
	test_panel_1 = M.ui_utils.create_text_box({
		panel_color = {r = 0, g = 127, b = 255, a = 160},
		text_color = {r = 255, g = 128, b = 0, a = 255},
		fill_mode = "fill",
		min_w = 100, min_h = 100,
		text = test_text,
		text_scale = .4,
		line_spacing = 1,
		font = 1,
		w_align = 0,
		h_align = 0,
	})

	-- Yellow panel
	test_panel_2 = M.ui_utils.create_panel({panel_color = {r = 255, g = 255, b = 0, a = 160}, fill_mode = "fill", min_w = 400, min_h = 400, padding_x = 10, padding_y = 10})

	-- Blue panel, red border
	test_panel_3 = M.ui_utils.create_panel({panel_color = {r  = 0, g = 0, b = 255, a = 160}, fill_mode = "fill", min_w = 200, min_h = 200, anchor_x = .5, anchor_y = .5, border_color = {r = 255, g = 0, b = 0, a = 255}, border_thickness = 10})

	-- Magenta panel
	test_panel_4 = M.ui_utils.create_panel({panel_color = {r  = 255, g = 0, b = 255, a = 160}, fill_mode = "w_fill", min_w = 200, min_h = 100, anchor_x = .5, anchor_y = 1, })

	-- Blue textbox, black border
	test_panel_5 = M.ui_utils.create_text_box({
		panel_color = {r = 0, g = 127, b = 255, a = 255},
		text_color = {r = 0, g = 0, b = 0, a = 255},
		shadow_color = { r = 255, g = 255, b = 255, a = 255 },
		border_color = {r = 0, g = 0, b = 0, a = 255},
		fill_mode = "no_fill",
		anchor_x = 1, anchor_y = .5,
		min_w = 300, min_h = 300,
		text = test_text,
		text_scale = .7,
		line_spacing = .8,
		font = 6,
		shadow_offset_x = 1,
		shadow_offset_y = 1,
		border_thickness = 10,
		w_align = .5,
		h_align = .5,
	})

	-- Green panel
	test_panel_6 = M.ui_utils.create_panel({panel_color = {r  = 0, g = 255, b = 0, a = 160}, fill_mode = "fill", min_w = 100, min_h = 100, draw_border = false})

	test_panel_2.children = {test_panel_5}
	test_h.children = {test_panel_1, test_panel_3, test_panel_6}
	test_v.children = {test_panel_2, test_h, test_panel_4}

	test_grid.children = {test_panel_1, test_panel_2, test_panel_3, test_panel_4}

	screen.children = {test_grid}

end

function M.on_hud_render()
	screen:render()
end

function M.update()
	-- Silly test that makes it go all over the screen
	--test_var_1 = test_var_1 + .025
	--test_var_2 = test_var_2 + .02
	--test_panel_5.arg_params.anchor_x = (math.sin(test_var_1) + 1) / 2
	--test_panel_1.arg_params.h_align = (math.sin(test_var_2) + 1) / 2
	--test_v.arg_params.anchor_x = (math.sin(test_var_1) + 1) / 2
	--test_v.arg_params.anchor_y = (math.cos(test_var_1) + 1) / 2
	--test_v.arg_params.min_w = (math.sin(test_var_2) + 1) / 2 * 600 + 500
	--test_v.arg_params.min_h = (math.cos(test_var_2) + 1) / 2 * 500 + 500
end

M.init()

hook_event(HOOK_UPDATE, M.update)
hook_event(HOOK_ON_HUD_RENDER, M.on_hud_render)

return M
