require("nvchad.options")

-- add yours here!

-- Enable relative number on startup
local o = vim.o
o.relativenumber = true
o.number = true
o.cursorline = true -- Highlight current cursor line

-- Enhanced folding options (will be managed by ufo plugin)
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
