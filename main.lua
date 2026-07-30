-- Using an object's arg_params, you can change how it behaves in real time.
-- Silly example that makes a textbox go all around the screen:

-- Add the tool
local ui_utils = require("ui_utils")

local test_var_1 = 0
local test_var_2 = 0

-- The base UI object that acts as the entire screen
local screen = ui_utils.create_screen()

-- The textbox, colored blue, with orange text
local test_textbox = ui_utils.create_textbox({
        panel_color = {r = 0, g = 127, b = 255, a = 160},
        text_color = {r = 255, g = 128, b = 0, a = 255},
        fill_mode = "no_fill",
        min_w = 300, min_h = 200,
        text = "Weeee!",
        text_scale = 1,
        font = 1,
        h_align = .5,
        v_align = .5,
    })

-- Add textbox to the screen
screen.children = {test_textbox}

-- Makes it go all over the screen
local function update()
	test_var_1 = test_var_1 + .025
	test_var_2 = test_var_2 + .02

    -- Update the anchor of the textbox
	test_textbox.arg_params.anchor_x = (math.sin(test_var_1) + 1) / 2
	test_textbox.arg_params.anchor_y = (math.cos(test_var_2) + 1) / 2
end

-- Render the screen and its children every frame
local function on_hud_render()
	screen:render()
end

hook_event(HOOK_UPDATE, update)
hook_event(HOOK_ON_HUD_RENDER, on_hud_render)
