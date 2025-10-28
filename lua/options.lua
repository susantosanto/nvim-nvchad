require("nvchad.options")

-- add yours here!

-- Enable relative number on startup
local o = vim.o
o.relativenumber = true
o.number = true
o.signcolumn = "yes" -- Always show sign column for todo-comments icons
o.cursorline = true -- Highlight current cursor line

-- Enhanced folding options (will be managed by ufo plugin)
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.autoindent = true
o.smartindent = true
o.smarttab = true
o.list = true
