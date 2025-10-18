-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "vscode_dark",
  transparency = true,

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.nvdash = { load_on_startup = false }
M.ui = {
  tabufline = {
    enabled = true, -- Aktifkan tabufline agar buffers terlihat
    lazyload = false,
    order = { "treeOffset", "buffers", "tabs", "btns" },
  },
  statusline = {
    theme = "minimal",
    -- Choose separator style: "default", "arrow", "round", "slant", or "block"
    separator_style = "block", -- Using arrow separators for modern look
    -- Define custom order of statusline components
    -- Hide statusline on focus loss
    hide_on_focus_loss = false,
    -- Custom modules can be defined here (currently using default modules)
    modules = nil,
  },
}

return M
