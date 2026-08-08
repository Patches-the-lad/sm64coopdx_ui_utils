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
| render    | bool   | Enables/disables rendering object            | true                         |
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
| render    | bool   | Enables/disables rendering object                            | true          |
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
| render           | bool   | Enables/disables rendering object                            | true                                 |
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
| render           | bool   | Enables/disables rendering object                            | true                                 |
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
| render | bool | Enables/disables rendering object | true |
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
| render    | bool   | Enables/disables rendering object                            | true          |
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
| render    | bool   | Enables/disables rendering object                            | true          |
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
| render    | bool   | Enables/disables rendering object                            | true          |
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

