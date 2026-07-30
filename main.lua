-- This sytem allows for styling by pre defining a list of parameters!
-- By pre-defining parameters in a table, you can style an entire set of UI objects all at once!
-- Even if any particular object does not use all of the parameters, they are still passed down to its children.

-- Add the tool
local ui_utils = require("ui_utils")

local style_a = {
	panel_color = {r = 255, g = 64, b = 64, a = 128}, -- Red background
	border_color = {r = 255, g = 0, b = 0, a = 255}, -- Red border
	border_thickness = 10, -- Thick border
	min_w = 600,
	min_h = 600,
	padding_x = 7, -- Little padding
	padding_y = 7,
	spacing_y = 40, -- Huge spacing between the text boxes
	fill_mode = "h_fill",
	anchor_x = 0, -- Stick the entire panel to the left
	font = 1, -- High res font
	text_scale = 1,
	text_color = {r = 255, g = 0, b = 0, a = 255}, -- Red text
	h_align = 0.5, -- Center text alignment
	v_align = 0.5,
}

local style_b = {
	panel_color = {r = 64, g = 64, b = 64, a = 128}, -- Grey background
	border_color = {r = 255, g = 255, b = 255, a = 255}, -- White border
	border_thickness = 3, -- Thin border
	min_w = 600,
	min_h = 600,
	padding_x = 30, -- Lots of padding
	padding_y = 30,
	spacing_y = 0, -- No spacing between the text boxes
	fill_mode = "h_fill",
	anchor_x = 1, -- Stick the entire panel to the right
	font = 6, -- Pixel font
	text_scale = 3,
	text_color = {r = 0, g = 0, b = 255, a = 255}, -- Blue text
	h_align = 0, -- Top left text alignment
	v_align = 0,
}

-- The base UI object that acts as the entire screen
local screen = ui_utils.create_screen({
        padding_x = 20,
        padding_y = 20,
})

-- Draws a background panel
local style_a_panel = ui_utils.create_panel(style_a)
-- Creates a vertical stack container that inherits all style parameters from its parent (style a), but also modify a few midway
local style_a_vstack = ui_utils.create_v_stack({
	-- Overriding some inherited variables
	min_w = 1,
	min_h = 1,
	fill_mode = "fill",
	anchor_x = .5,
})

-- Draws a background panel
local style_b_panel = ui_utils.create_panel(style_b)
-- Creates a vertical stack container that inherits all style parameters from its parent (style b), but also modify a few midway
local style_b_vstack = ui_utils.create_v_stack({
	-- Overriding some inherited variables
	min_w = 1,
	min_h = 1,
	fill_mode = "fill",
	anchor_x = .5,
})

-- Draws two textboxes that inherit all style parameters from their parent
local style_a_textbox_1 = ui_utils.create_textbox({text = "I'm style A!"})
local style_a_textbox_2 = ui_utils.create_textbox({text = "I'm also style A!"})

-- Draws two textboxes that inherit all style parameters from their parent
local style_b_textbox_1 = ui_utils.create_textbox({text = "I'm style B!"})
local style_b_textbox_2 = ui_utils.create_textbox({text = "I'm also style B!"})

-- Add the textboxes to their stacks, add the stacks to the panels
style_a_vstack.children = {style_a_textbox_1, style_a_textbox_2}
style_a_panel.children = {style_a_vstack}

style_b_vstack.children = {style_b_textbox_1, style_b_textbox_2}
style_b_panel.children = {style_b_vstack}

-- Add panels to the screen
screen.children = {style_a_panel, style_b_panel}

-- Render the screen and its children every frame
function on_hud_render()
    screen:render()
end

hook_event(HOOK_ON_HUD_RENDER, on_hud_render)
