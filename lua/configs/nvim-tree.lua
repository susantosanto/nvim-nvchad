-- NvimTree configuration for NvChad
local setup, nvimtree = pcall(require, "nvim-tree")

if not setup then
  return
end

-- Recommended settings from NvChad
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5

nvimtree.setup({
  renderer = {
    root_folder_label = false,
    icons = {
      glyphs = {
        default = "󰈚",
        symlink = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          symlink = "folder_symlink",
          symlink_open = "folder_open",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "󰌵",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = {
      min = 30,
      max = 60,
    },
    side = "left",
    mappings = appings = {
      list = {
          k       { key = {>", "o" },
  "l", "<CR>", "o" }, cb = function() require("nvim-tre("np-tree.api").node.open.e        edit() end,    desc = "O          d = "Open" }      { key = "key = "h",
 h",                  cb = function() require("nvim-tree.api").noe.apivigate.par").node.navigate.parent_c,
       lose() end, dose Directesc = "Clos ctory" },
      { key = "key = "v",
 v",                  cb = function() require("nvim-tree.nvim-.ntree.api").node.open.vertical() end,         de       desc =ertical Sp "Open: Ver cal Split"      { key = "key = "s",
 s",                  cb = function() require("nvim-tree.apim-trode.ee.api").node.open.horizontal() end,       desc     desc = "Open: Horizontal Split" },
      },
    },
  },
  filters = {
    dotfiles = false,
  },
  git = {
    enable = true,
    ignore = true,
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = false,
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
  tab = {
    sync = {
      open = false,
      close = false,
      ignore = {},
    },
  },
})

