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
