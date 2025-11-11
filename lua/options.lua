require("nvchad.options")

-- add yours here!

-- Enable relative number on startup
local o = vim.o
o.relativenumber = true
o.number = true
vim.go.numberwidth = 4
o.signcolumn = "yes:3" -- Always show sign column with 3 character width for more space
o.cursorline = true -- Highlight current cursor line
o.cursorlineopt = "both"
o.sidescrolloff = 8
o.wrap = true
o.showtabline = 0
o.splitbelow = true
o.splitright = true
o.splitkeep = "screen"
o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:,vert:│]]

-- === SEARCH & COMPLETION ===
o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.hlsearch = true

-- Enhanced folding options (will be managed by ufo plugin)
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
o.foldcolumn = "1" -- Set to 1 to create space on the left side

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 2
o.autoindent = true
o.smartindent = true
o.smarttab = true
o.list = true
-- o.listchars = "lead:·,tab:  ,space: ,trail: "

o.timeoutlen = 400
o.termguicolors = true
o.pumblend = 10
o.pumblend = 10
