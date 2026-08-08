-- Add the tool
local ui_utils = require("ui_utils")

-- The base UI object that acts as the entire screen
local screen = ui_utils.create_screen({
        padding_x = 20,
        padding_y = 20,
    })

-- A background panel
local panel = ui_utils.create_panel({
        panel_color = {r = 0, g = 0, b = 0, a = 128},
        min_w = 400,
        min_h = 400,
        padding_x = 10,
        padding_y = 10,
        fill_mode = "no_fill",
    })

-- A vertical stack object
local v_stack = ui_utils.create_v_stack({
		fill_mode = "fill",
		min_w = 1,
		min_h = 1,
		h_align = 0.5,
        v_align = 0.5,
        text_scale = 1,
        draw_border = true,
	})

-- Draws a red textbox that takes up 1/3 of the vertical stack
local red_textbox = ui_utils.create_textbox({
        text = "I'm red!",
        text_color = {r = 255, g = 0, b = 0, a = 255},
        panel_color = {r = 128, g = 0, b = 0, a = 128},
        border_color = {r = 255, g = 0, b = 0, a = 255},
    })

-- Draws a green textbox that takes up 1/3 of the vertical stack
local green_textbox = ui_utils.create_textbox({
        text = "I'm green!",
        text_color = {r = 0, g = 255, b = 0, a = 255},
        panel_color = {r = 0, g = 128, b = 0, a = 128},
        border_color = {r = 0, g = 255, b = 0, a = 255},
    })

-- Draws a blue textbox that takes up 1/3 of the vertical stack
local blue_textbox = ui_utils.create_textbox({
        text = "I'm blue!",
        text_color = {r = 0, g = 0, b = 255, a = 255},
        panel_color = {r = 0, g = 0, b = 128, a = 128},
        border_color = {r = 0, g = 0, b = 255, a = 255},
    })

-- Add v_stack to the panel
panel.children = {v_stack}

-- Add textboxes to the vertical stack
v_stack.children = {red_textbox, green_textbox, blue_textbox}

-- Add panel to the screen
screen.children = {panel}

-- Render the screen and its children every frame
function on_hud_render()
    screen:render()
end

hook_event(HOOK_ON_HUD_RENDER, on_hud_render)

