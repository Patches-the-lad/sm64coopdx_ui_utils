# Documentation

Using the functions below, you can create UI objects with whatever specified parameters you like. ***When creating an object, you do not need to fill out all of the parameters, and you do not need to fill them out in order.***

# Functions:



## create_screen

------

### Description

Creates a screen UI object. This object acts as the root of the UI tree.

### Lua Example

`local screen = ui_utils.create_screen({arg_params})`

### Parameters

| Name      | Type   | Description                                  | Default value                |
| --------- | ------ | -------------------------------------------- | ---------------------------- |
| x         | int    | X position from the left in pixels           | 0                            |
| y         | int    | Y position from the top in pixels            | 0                            |
| min_w     | int    | Minimum width                                | 1                            |
| min_h     | int    | Minimum height                               | 1                            |
| rel_w     | num    | Relative width                               | nil                          |
| rel_h     | num    | Relative height                              | nil                          |
| max_w     | int    | Maximum width                                | djui_hud_get_screen_width()  |
| max_h     | int    | Maximum height                               | djui_hud_get_screen_height() |
| padding_x | int    | Horizontal padding for children              | 0                            |
| padding_y | int    | Vertical padding for children                | 0                            |
| fill_mode | string | Unused by screen, gets inherited by children | "fill"                       |

### Returns

- Table containing screen object



## create_container

------

### Description

Creates a container UI object. This object acts as the most basic form of container and does not render anything itself.

### Lua Example

`local container = ui_utils.create_container({arg_params})`

### Parameters

| Name      | Type   | Description                                                  | Default value |
| --------- | ------ | ------------------------------------------------------------ | ------------- |
| x_offset  | int    | X position offset from the left in pixels                    | 0             |
| y_offset  | int    | Y position offset from the top in pixels                     | 0             |
| min_w     | int    | Minimum width                                                | 1             |
| min_h     | int    | Minimum height                                               | 1             |
| rel_w     | num    | Relative width                                               | nil           |
| rel_h     | num    | Relative height                                              | nil           |
| padding_x | int    | Horizontal padding for children                              | 10            |
| padding_y | int    | Vertical padding for children                                | 10            |
| anchor_x  | num    | Anchors objects within their bounds horizontally<br />Range: 0 - 1<br />0  = Left<br />1 = Right<br />.5 = Middle | 0             |
| anchor_y  | num    | Anchors objects within their bounds vertically<br />Range: 0 - 1<br />0  = Top<br />1 = Bottom<br />.5 = Middle | 0             |
| fill_mode | string | "fill" = fill x & y, "<br />w_fill" = fill x only, <br />"h_fill" = fill y only, <br />"no_fill" = use minimum width and height | "fill"        |

### Returns

- Table containing container object



## create_panel

------

### Description

Creates a Panel UI object. This object is very similar to the container, except that it can draw a background and border.

### Lua Example

`local panel = ui_utils.create_panel({arg_params})`

### Parameters

| Name             | Type   | Description                                                  | Default value                        |
| ---------------- | ------ | ------------------------------------------------------------ | ------------------------------------ |
| x_offset         | int    | X position offset from the left in pixels                    | 0                                    |
| y_offset         | int    | Y position offset from the top in pixels                     | 0                                    |
| min_w            | int    | Minimum width                                                | 1                                    |
| min_h            | int    | Minimum height                                               | 1                                    |
| rel_w            | num    | Relative width                                               | nil                                  |
| rel_h            | num    | Relative height                                              | nil                                  |
| padding_x        | int    | Horizontal padding for children                              | 10                                   |
| padding_y        | int    | Vertical padding for children                                | 10                                   |
| anchor_x         | num    | Anchors objects within their bounds horizontally<br />Range: 0 - 1<br />0  = Left<br />1 = Right<br />.5 = Middle | 0                                    |
| anchor_y         | num    | Anchors objects within their bounds vertically<br />Range: 0 - 1<br />0  = Top<br />1 = Bottom<br />.5 = Middle | 0                                    |
| fill_mode        | string | "fill" = fill x & y, "<br />w_fill" = fill x only, <br />"h_fill" = fill y only, <br />"no_fill" = use minimum width and height | "fill"                               |
| panel_color      | table  | Table describing red, green, blue, and alpha numbers in the range of 0-255<br />{r, g, b, a}<br />Examples:<br />Solid white: {r = 255, g = 255, b = 255, a = 255}<br />Solid black: {r = 0, g = 0, b = 0, a = 255}<br />Transparent black: {r = 0, g = 0, b = 0, a = 160}<br />Solid red: {r = 255, g = 0, b = 0, a = 255} | {r = 0, g = 0, b = 0, a = 127}       |
| draw_border      | bool   | Enables or disables rendering a border around the panel      | true                                 |
| border_color     | table  | Table describing red, green, blue, and alpha numbers in the range of 0-255<br />{r, g, b, a}<br />Examples:<br />Solid white: {r = 255, g = 255, b = 255, a = 255}<br />Solid black: {r = 0, g = 0, b = 0, a = 255}<br />Transparent black: {r = 0, g = 0, b = 0, a = 160}<br />Solid red: {r = 255, g = 0, b = 0, a = 255} | {r = 255, g = 255, b = 255, a = 255} |
| border_thickness | int    | thickness of the border in pixels                            | 3                                    |

### Returns

- Table containing panel object



## create_textbox

------

### Description

Creates a Textbox UI object. This object is similar to the panel, except that it can also draw text.

### Lua Example

`local textbox = ui_utils.create_textbox({arg_params})`

### Parameters

| Name             | Type   | Description                                                  | Default value                        |
| ---------------- | ------ | ------------------------------------------------------------ | ------------------------------------ |
| x_offset         | int    | X position offset from the left in pixels                    | 0                                    |
| y_offset         | int    | Y position offset from the top in pixels                     | 0                                    |
| min_w            | int    | Minimum width                                                | 1                                    |
| min_h            | int    | Minimum height                                               | 1                                    |
| rel_w            | num    | Relative width                                               | nil                                  |
| rel_h            | num    | Relative height                                              | nil                                  |
| padding_x        | int    | Horizontal padding for children                              | 10                                   |
| padding_y        | int    | Vertical padding for children                                | 10                                   |
| anchor_x         | num    | Anchors objects within their bounds horizontally<br />Range: 0 - 1<br />0  = Left<br />1 = Right<br />.5 = Middle | 0                                    |
| anchor_y         | num    | anchors objects within their bounds vertically<br />Range: 0 - 1<br />0  = Top<br />1 = Bottom<br />.5 = Middle | 0                                    |
| fill_mode        | string | "fill" = fill x & y, "<br />w_fill" = fill x only, <br />"h_fill" = fill y only, <br />"no_fill" = use minimum width and height | "fill"                               |
| panel_color      | table  | Table describing red, green, blue, and alpha numbers in the range of 0-255<br />{r, g, b, a}<br />Examples:<br />Solid white: {r = 255, g = 255, b = 255, a = 255}<br />Solid black: {r = 0, g = 0, b = 0, a = 255}<br />Transparent black: {r = 0, g = 0, b = 0, a = 160}<br />Solid red: {r = 255, g = 0, b = 0, a = 255} | {r = 0, g = 0, b = 0, a = 127}       |
| draw_border      | bool   | Enables or disables rendering a border around the panel      | true                                 |
| border_color     | table  | Table describing red, green, blue, and alpha numbers in the range of 0-255<br />{r, g, b, a}<br />Examples:<br />Solid white: {r = 255, g = 255, b = 255, a = 255}<br />Solid black: {r = 0, g = 0, b = 0, a = 255}<br />Transparent black: {r = 0, g = 0, b = 0, a = 160}<br />Solid red: {r = 255, g = 0, b = 0, a = 255} | {r = 255, g = 255, b = 255, a = 255} |
| border_thickness | int    | Thickness of the border in pixels                            | 3                                    |
| text             | string | The text that gets drawn inside of the box                   | "default text"                       |
| text_scale       | num    | The scale of the text                                        | 1.0                                  |
| text_color       | table  | Table describing red, green, blue, and alpha numbers in the range of 0-255<br />{r, g, b, a}<br />Examples:<br />Solid white: {r = 255, g = 255, b = 255, a = 255}<br />Solid black: {r = 0, g = 0, b = 0, a = 255}<br />Transparent black: {r = 0, g = 0, b = 0, a = 160}<br />Solid red: {r = 255, g = 0, b = 0, a = 255} | {r = 255, g = 255, b = 255, a = 255} |
| font             | int    | Integer describing one of the built-in fonts in COOPDX<br />Range: 0 - 6 | 3                                    |
| text_padding_x   | int    | X position of the text within the box from the left in pixels | 10                                   |
| text_padding_y   | int    | Y position of the text within the box from the top in pixels | 10                                   |
| word_wrap        | bool   | Enables or disables word wrap, when words automatically move to the next line when they are too long for the box | true                                 |
| char_wrap        | bool   | Enables or disables character wrap, when very long words or strings are broken up into multiple lines | true                                 |
| line_spacing     | num    | The spacing between lines in pixels                          | 1.0                                  |
| h_align          | num    | Horizontal text alignment<br />Range: 0 - 1<br />0 = Left<br />1 = Right<br />.5 = Center | 0                                    |
| v_align          | num    | Vertical text alignment<br />Range: 0 - 1<br />0 = Top<br />1 = Bottom<br />.5 = Center | 0                                    |
| use_shadow       | bool   | Enables or disables rendering a shadow behind the text       | true                                 |
| shadow_color     | table  | Table describing red, green, blue, and alpha numbers in the range of 0-255<br />{r, g, b, a}<br />Examples:<br />Solid white: {r = 255, g = 255, b = 255, a = 255}<br />Solid black: {r = 0, g = 0, b = 0, a = 255}<br />Transparent black: {r = 0, g = 0, b = 0, a = 160}<br />Solid red: {r = 255, g = 0, b = 0, a = 255} | {r = 0, g = 0, b = 0, a = 150}       |
| shadow_offset_x  | int    | X position of the shadow from the left relative to the text in pixels | 2                                    |
| shadow_offset_y  | int    | Y position of the shadow from the top relative to the text in pixels | 2                                    |

### Returns

- Table containing textbox object



## create_texture

------

### Description

Creates a texture UI object. This object is very similar to the panel, except that it renders a texture. to add a texture to your project, add a png file to the "textures" folder. Textures added to your project must have an aspect ratio of 1:1, have a width/height of n^2 (2, 4, 8, 16, 32, etc...).

### Lua Example

`local texture = ui_utils.create_texture({arg_params})`

### Parameters

| Name             | Type     | Description                                                  | Default value                        |
| ---------------- | -------- | ------------------------------------------------------------ | ------------------------------------ |
| x_offset         | int      | X position offset from the left in pixels                    | 0                                    |
| y_offset         | int      | Y position offset from the top in pixels                     | 0                                    |
| min_w            | int      | Minimum width                                                | 1                                    |
| min_h            | int      | Minimum height                                               | 1                                    |
| rel_w            | num      | Relative width                                               | nil                                  |
| rel_h            | num      | Relative height                                              | nil                                  |
| padding_x        | int      | Horizontal padding for children                              | 0                                  |
| padding_y        | int      | Vertical padding for children                                | 0                                  |
| anchor_x         | num      | Anchors objects within their bounds horizontally<br />Range: 0 - 1<br />0  = Left<br />1 = Right<br />.5 = Middle | 0                                    |
| anchor_y         | num      | Anchors objects within their bounds vertically<br />Range: 0 - 1<br />0  = Top<br />1 = Bottom<br />.5 = Middle | 0                                    |
| fill_mode        | string   | "fill" = fill x & y, "<br />w_fill" = fill x only, <br />"h_fill" = fill y only, <br />"no_fill" = use minimum width and height | "fill"|
| tex_info         | tex_info | Texture info (use `get_texture_info("name_of_your_png")`)    | nil                                  |
| base_size        | int      | The width/height of your png in pixels                       | 256                                  |
| draw_border      | bool     | Enables or disables rendering a border around the panel      | false                                |
| border_color     | table    | Table describing red, green, blue, and alpha numbers in the range of 0-255<br />{r, g, b, a}<br />Examples:<br />Solid white: {r = 255, g = 255, b = 255, a = 255}<br />Solid black: {r = 0, g = 0, b = 0, a = 255}<br />Transparent black: {r = 0, g = 0, b = 0, a = 160}<br />Solid red: {r = 255, g = 0, b = 0, a = 255} | {r = 255, g = 255, b = 255, a = 255} |
| border_thickness | int      | thickness of the border in pixels                            | 3                                    |

### Returns

- Table containing texture object



## create_h_stack

------

### Description

Creates a horizontal stack UI object. This object acts as an advanced form of the basic container, stacking children within it horizontally.

### Lua Example

`local h_stack = ui_utils.create_h_stack({arg_params})`

### Parameters

| Name      | Type   | Description                                                  | Default value |
| --------- | ------ | ------------------------------------------------------------ | ------------- |
| x_offset  | int    | X position offset from the left in pixels                    | 0             |
| y_offset  | int    | Y position offset from the top in pixels                     | 0             |
| min_w     | int    | Minimum width                                                | 1             |
| min_h     | int    | Minimum height                                               | 1             |
| rel_w     | num    | Relative width                                               | nil           |
| rel_h     | num    | Relative height                                              | nil           |
| padding_x | int    | Horizontal padding for children                              | 10            |
| padding_y | int    | Vertical padding for children                                | 10            |
| spacing_x | int    | Horizontal spacing between children objects in pixels        | 5             |
| anchor_x  | num    | Anchors objects within their bounds horizontally<br />Range: 0 - 1<br />0  = Left<br />1 = Right<br />.5 = Middle | 0             |
| anchor_y  | num    | Anchors objects within their bounds vertically<br />Range: 0 - 1<br />0  = Top<br />1 = Bottom<br />.5 = Middle | 0             |
| fill_mode | string | "fill" = fill x & y, "<br />w_fill" = fill x only, <br />"h_fill" = fill y only, <br />"no_fill" = use minimum width and height | "fill"        |

### Returns

- Table containing h_stack object



## create_v_stack

------

### Description

Creates a vertical stack UI object. This object acts as an advanced form of the basic container, stacking children within it vertically.

### Lua Example

`local v_stack = ui_utils.create_v_stack({arg_params})`

### Parameters

| Name      | Type   | Description                                                  | Default value |
| --------- | ------ | ------------------------------------------------------------ | ------------- |
| x_offset  | int    | X position offset from the left in pixels                    | 0             |
| y_offset  | int    | Y position offset from the top in pixels                     | 0             |
| min_w     | int    | Minimum width                                                | 1             |
| min_h     | int    | Minimum height                                               | 1             |
| rel_w     | num    | Relative width                                               | nil           |
| rel_h     | num    | Relative height                                              | nil           |
| padding_x | int    | Horizontal padding for children                              | 10            |
| padding_y | int    | Vertical padding for children                                | 10            |
| spacing_y | int    | Vertical spacing between children objects in pixels          | 5             |
| anchor_x  | num    | Anchors objects within their bounds horizontally<br />Range: 0 - 1<br />0  = Left<br />1 = Right<br />.5 = Middle | 0             |
| anchor_y  | num    | Anchors objects within their bounds vertically<br />Range: 0 - 1<br />0  = Top<br />1 = Bottom<br />.5 = Middle | 0             |
| fill_mode | string | "fill" = fill x & y, "<br />w_fill" = fill x only, <br />"h_fill" = fill y only, <br />"no_fill" = use minimum width and height | "fill"        |

### Returns

- Table containing v_stack object



## create_grid

------

### Description

Creates a grid UI object. This object acts as an advanced form of the basic container, stacking children within it in a grid pattern. Children added to this object will be stacked in reading order (top left to bottom right), so the number of rows and columns is very important to laying out the children.

### Lua Example

`local grid = ui_utils.create_grid({arg_params})`

### Parameters

| Name      | Type   | Description                                                  | Default value |
| --------- | ------ | ------------------------------------------------------------ | ------------- |
| x_offset  | int    | X position offset from the left in pixels                    | 0             |
| y_offset  | int    | Y position offset from the top in pixels                     | 0             |
| min_w     | int    | Minimum width                                                | 1             |
| min_h     | int    | Minimum height                                               | 1             |
| rel_w     | num    | Relative width                                               | nil           |
| rel_h     | num    | Relative height                                              | nil           |
| padding_x | int    | Horizontal padding for children                              | 10            |
| padding_y | int    | Vertical padding for children                                | 10            |
| spacing_x | int    | Horizontal spacing between children objects in pixels        | 5             |
| spacing_y | int    | Vertical spacing between children objects in pixels          | 5             |
| anchor_x  | num    | Anchors objects within their bounds horizontally<br />Range: 0 - 1<br />0  = Left<br />1 = Right<br />.5 = Middle | 0             |
| anchor_y  | num    | Anchors objects within their bounds vertically<br />Range: 0 - 1<br />0  = Top<br />1 = Bottom<br />.5 = Middle | 0             |
| fill_mode | string | "fill" = fill x & y, "<br />w_fill" = fill x only, <br />"h_fill" = fill y only, <br />"no_fill" = use minimum width and height | "fill"        |
| rows      | int    | Number of rows in the grid                                   | 1             |
| cols      | int    | Number of columns in the grid                                | 1             |

### Returns

- Table containing grid object



# Examples:

## Simple colored panel:

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

## Simple centered title card:

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

## Texture:

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
    min_w = 500, min_h = 500,
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

## Proportional sizing:

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

## Vertical stack of textboxes:

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

## Styling:

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

## Textbox going all over the screen:

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

```

