# Examples:

## Simple colored panel:

Draws a red square at the top left of the screen.

```lua
-- Add the tool
local ui_utils = require("ui_utils")

-- The base UI object that acts as the entire screen
local screen = ui_utils.create_screen({
        padding_x = 10,
        padding_y = 10,
	})

-- The panel, colored red
local panel = ui_utils.create_panel({
        panel_color = {r = 255, g = 0, b = 0, a = 255},
        min_w = 200,
        min_h = 200,
        fill_mode = "no_fill",
        draw_border = false,
    })

-- Add panel to the screen
screen.children = {panel}

-- Render the screen and its children every frame
function on_hud_render()
	screen:render()
end

hook_event(HOOK_ON_HUD_RENDER, on_hud_render)
```

------

## Simple centered title card:

Draws a big textbox that covers almost the entire screen.

```lua
-- Add the tool
local ui_utils = require("ui_utils")

-- The base UI object that acts as the entire screen
local screen = ui_utils.create_screen({
        padding_x = 40,
        padding_y = 40,
    })

-- Draws a text panel that covers the entire screen
local textbox = ui_utils.create_textbox({
        text = "Hello, world!",
        text_scale = 3,
        font = 1,
        h_align = 0.5,
        v_align = 0.5,
        fill_mode = "fill",
        text_color = {r = 255, g = 255, b = 255, a = 255},
        panel_color = {r = 0, g = 0, b = 0, a = 160},
        draw_border = false,
    })

-- Add textbox to the screen
screen.children = {textbox}

-- Render the screen and its children every frame
function on_hud_render()
    screen:render()
end

hook_event(HOOK_ON_HUD_RENDER, on_hud_render)
```

------

## Texture:

Renders a basic star texture to the top left corner of the screen.

```lua
-- Add the tool
local ui_utils = require("ui_utils")

-- Add the texture info
local star_tex_info = get_texture_info("star") -- Put your textures in the "textures" folder. Textures must be a square of any size n^2

-- The base UI object that acts as the entire screen
local screen = ui_utils.create_screen({
    padding_x = 10,
    padding_y = 10
})

-- Draws a star texture
local star_texture = ui_utils.create_texture({
    tex_info = star_tex_info,
    base_size = 128, -- Set this to the width/height of your texture
    min_w = 256, min_h = 256,
    fill_mode = "no_fill",
})

-- Add texture to the screen
screen.children = {star_texture}

-- Render the screen and its children every frame
local function on_hud_render()
	screen:render()
end

hook_event(HOOK_ON_HUD_RENDER, on_hud_render)
```

------

## Proportional sizing:

Shows off proportional sizing. Objects with propotional sizing will clamp their maximum size in proportion to their `rel_w` and `rel_h` parameters.

```lua
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
```

------

## Vertical stack of textboxes:

Draws a background panel, puts a vertical stack container inside the panel, then puts three colored text boxes within the stack container.

```lua
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
	})

-- Draws a red textbox that takes up 1/3 of the vertical stack
local red_textbox = ui_utils.create_textbox({
        text = "I'm red!",
        text_scale = 1,
        h_align = 0.5,
        v_align = 0.5,
        fill_mode = "fill",
        draw_border = true,
        text_color = {r = 255, g = 0, b = 0, a = 255},
        panel_color = {r = 128, g = 0, b = 0, a = 128},
        border_color = {r = 255, g = 0, b = 0, a = 255},
    })

-- Draws a green textbox that takes up 1/3 of the vertical stack
local green_textbox = ui_utils.create_textbox({
        text = "I'm green!",
        text_scale = 1,
        h_align = 0.5,
        v_align = 0.5,
        fill_mode = "fill",
        draw_border = true,
        text_color = {r = 0, g = 255, b = 0, a = 255},
        panel_color = {r = 0, g = 128, b = 0, a = 128},
        border_color = {r = 0, g = 255, b = 0, a = 255},
    })

-- Draws a blue textbox that takes up 1/3 of the vertical stack
local blue_textbox = ui_utils.create_textbox({
        text = "I'm blue!",
        text_scale = 1,
        h_align = 0.5,
        v_align = 0.5,
        fill_mode = "fill",
        draw_border = true,
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

```

------

## Styling:

Draws two nested UI elements with different predefined "styles".

```lua
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
```

------

## Textbox going all over the screen:

Draws a textbox that flies around the screen in a semi-random pattern.

```lua
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
	test_var_1 = test_var_1 + .03141
	test_var_2 = test_var_2 + .01414

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

```

