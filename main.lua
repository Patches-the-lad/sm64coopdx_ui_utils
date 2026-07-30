-- Add the tool
local ui_utils = require("ui_utils")

-- The base UI object that acts as the entire screen
local screen = ui_utils.create_screen({
        padding_x = 20,
        padding_y = 20,
    })

-- Draws a background panel
local panel = ui_utils.create_panel({
        panel_color = {r = 0, g = 0, b = 0, a = 128},
        min_w = 600,
        min_h = 600,
        padding_x = 0,
        padding_y = 0,
        fill_mode = "no_fill",
    })

-- Draws a textbox that takes up 1/9 of the space
local textbox = ui_utils.create_textbox({
        -- Text params
        text = "I'm small!",
        text_scale = 1,
        h_align = 0.5,
        v_align = 0.5,

        -- Positioning params
        min_w = 10, -- Override the min_x and min_y that was inherited with something small
        min_h = 10,

        anchor_x = .5, -- Position in the center of my parent
        anchor_y = .5,

        fill_mode = "fill", -- Despite being set to "fill", only fill a space proportional to rel_w and rel_h
        rel_h = 0.33,
        rel_w = 0.33,

        -- Rendering params
        draw_border = true,
        text_color = {r = 255, g = 255, b = 255, a = 255},
        panel_color = {r = 0, g = 0, b = 0, a = 128},
        border_color = {r = 255, g = 255, b = 255, a = 255},
    })

-- Add textbox to the panel
panel.children = {textbox}

-- Add panel to the screen
screen.children = {panel}

-- Render the screen and its children every frame
function on_hud_render()
    screen:render()
end

hook_event(HOOK_ON_HUD_RENDER, on_hud_render)
