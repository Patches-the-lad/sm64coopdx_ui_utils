# SM64 Co-op DX UI Utils

SM64 Co-op DX UI Utils (or just UI Utils) Is a flexible, general purpose UI system for *Super Mario 64 Co-op Deluxe*. 

Instead of manually calculating every pixel coordinate for your HUD, UI Utils allows you to build interfaces using a hierarchical system of containers, stacks, and panels. It handles the tedious math of anchoring, padding, and alignment so you can focus on the design of your mod.

## 🚀 Key Features

- Layout Containers: Quickly organize elements using `VStack` (vertical), `HStack` (horizontal), and `Grid` layouts.
- Smart Anchoring: Easily pin elements to the center, corners, or edges of the screen or their parent containers.
- Dynamic Padding & Spacing: Built-in support for internal padding and gap spacing between elements.
- Flexible Fill Modes: Control how elements expand or shrink to fit their available space.
- Rich Text Support: Advanced text boxes with automatic word-wrapping, character-wrapping, and shadow effects.
- Component Hierarchy: A semi-OOP approach where elements can have children, allowing for complex, nested UI structures.

------

## 🛠️ The Core System

UI Utils is designed as a system, not a finished product. It provides the primitives needed to build any interface imaginable.

### Available Components

| Component | Description                                                  |
| :-------- | :----------------------------------------------------------- |
| `Screen`  | The root container that encompasses the entire display.      |
| `Panel`   | A basic rectangular area with customizable colors and borders. |
| `TextBox` | A panel specifically optimized for rendering formatted text. |
| `HStack`  | A layout container that aligns children horizontally.        |
| `VStack`  | A layout container that aligns children vertically.          |
| `Grid`    | A layout container that organizes children into rows and columns. |

------

## 💻 Quick Example

Here is how simple it is to create a centered, padded panel containing a text box:

lua

```lua
local M = {}
local ui_utils = require("ui_utils")

function M.init()
    -- Create the main screen
    local screen = ui_utils.create_screen()

    -- Create a centered panel
    local main_panel = ui_utils.create_panel({
        panel_color = {r = 0, g = 0, b = 0, a = 160},
        anchor_x = 0.5,
        anchor_y = 0.5,
        fill_mode = "no_fill",
        min_w = 400,
        min_h = 200,
        padding_x = 30,
        padding_y = 30,
    })

    -- Create a text box to put inside that panel
    local welcome_text = ui_utils.create_text_box({
        panel_color = {r = 128, g = 128, b = 128, a = 160},
        text = "Welcome to my Mod!",
        text_scale = 1,
        h_align = 0.5,
        v_align = 0.5,
        fill_mode = "no_fill",
        min_w = 300,
        min_h = 100,
    })

    -- Nest the text box inside the panel, and the panel inside the screen
    main_panel.children = {welcome_text}
    screen.children = {main_panel}

    M.screen = screen
end

function M.on_hud_render()
    M.screen:render() -- Render the screen (Updates UI in real time!)
end

M.init()
hook_event(HOOK_ON_HUD_RENDER, M.on_hud_render)

return M

```

![image-20260728170929776](/home/patches/.config/Typora/typora-user-images/image-20260728170929776.png)

------

## 🏗️ Architecture

The system utilizes a semi-OOP approach via Lua metatables. Each UI object maintains its own set of `defaults` and `arg_params`. When `render()` is called:

1. The system merges the defaults with your custom parameters.
2. It computes the absolute position based on the parent's dimensions and the element's anchoring/padding.
3. It renders the element and recursively tells all children to do the same.

## 📜 How to use in your own projects

Simply add these mandatory scripts into your project:

- ui_utils.lua
- ui_helpers.lua
- ui_screen.lua

As well as these object scripts:

- ui_container.lua
- ui_panel.lua
- ui_textbox.lua
- ui_hstack.lua
- ui_vstack.lua
- ui_grid.lua

In your main script or dedicated UI script, include:

```lua
-- Add the tool
local ui_utils = require("ui_utils")

-- The base UI object that acts as the entire screen
local screen = ui_utils.create_screen()

-- Add UI objects to the screen
-- screen.children = {ui_object}

-- Render the screen and its children every frame
function on_hud_render()
	screen:render()
end

hook_event(HOOK_ON_HUD_RENDER, on_hud_render)
```

------



## 🤝 Contributing

This is an open-source project. Pull requests and issue reports are welcome!

If you feel that a feature is missing (such as buttons, sliders, drop down menus, progress bars, images, etc), feel free to fork the project and write in the object yourself! There are detailed instructions on exactly how to do it included.