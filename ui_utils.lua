-- UI Utils
--
-- DISCLAIMER: AI did indeed comment on and even write some of this code. This is still mostly the work of a human who is vigorously testing it
--
-- Layout/rendering helpers for building UI from simple primitives.
-- Each UI object:
--   1) stores defaults,
--   2) merges them with passed-in args,
--   3) computes its size/position inside its parent,
--   4) renders itself and then its children.

-- =========================================================
-- Exposed API
-- =========================================================

local ui_screen = require("ui_screen")
local ui_container = require("ui_container")
local ui_panel = require("ui_panel")
local ui_textbox = require("ui_textbox")
local ui_hstack = require("ui_hstack")
local ui_vstack = require("ui_vstack")
local ui_grid = require("ui_grid")

local M = {}

function M.init()
    ui_screen.init(M)
	ui_container.init(M)
	ui_panel.init(M)
	ui_textbox.init(M)
	ui_hstack.init(M)
	ui_vstack.init(M)
	ui_grid.init(M)
end

-- Factory helpers for creating UI objects with empty child lists.
function M.create_screen(arg_params) return setmetatable({ children = {}, arg_params = arg_params or {}, defaults = ui_screen.Screen.defaults }, ui_screen.Screen) end
function M.create_container(arg_params) return setmetatable({ children = {}, arg_params = arg_params or {}, defaults = ui_container.Container.defaults }, ui_container.Container) end
function M.create_panel(arg_params) return setmetatable({ children = {}, arg_params = arg_params or {}, defaults = ui_panel.Panel.defaults }, ui_panel.Panel) end
function M.create_textbox(arg_params) return setmetatable({ children = {}, arg_params = arg_params or {}, defaults = ui_textbox.TextBox.defaults }, ui_textbox.TextBox) end
function M.create_h_stack(arg_params) return setmetatable({ children = {}, arg_params = arg_params or {}, defaults = ui_hstack.HStack.defaults }, ui_hstack.HStack) end
function M.create_v_stack(arg_params) return setmetatable({ children = {}, arg_params = arg_params or {}, defaults = ui_vstack.VStack.defaults }, ui_vstack.VStack) end
function M.create_grid(arg_params) return setmetatable({ children = {}, arg_params = arg_params or {}, defaults = ui_grid.Grid.defaults }, ui_grid.Grid) end

-- Export classes too, in case callers want direct access.
M.Screen = ui_screen.Screen
M.Container = ui_container.Container
M.Panel = ui_panel.Panel
M.TextBox = ui_textbox.TextBox
M.HStack = ui_hstack.HStack
M.VStack = ui_vstack.VStack
M.Grid = ui_grid.Grid

return M

