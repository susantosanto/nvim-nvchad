-- ~/.config/nvim/lua/plugins/init.lua
return {
  -- Dependency: nui.nvim
  {
    "MunifTanjim/nui.nvim",
    lazy = true, -- Lazy load untuk performa
  },
  -- Main plugin: FkNotes.nvim
  {
    "flashcodes-themayankjha/Fknotes.nvim",
    lazy = false, -- Load on startup karena keymaps global
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("fknotes").setup {
        default_note_dir = vim.fn.expand "~/notes",
        obsidian_path = nil, -- Set jika pakai Obsidian vault
        default_task_priority = "medium",
        default_task_due_date = "today",
        ui = {
          colorscheme = nil, -- Gunakan theme NvChad (e.g., tokyonight)
          border_style = "rounded", -- Clean & professional
          menu_width = 50,
          menu_height = 12,
          task_browser_width = 70,
          task_browser_height = 18,
          task_form_width = 55,
          task_form_height = 15,
          date_picker_width = 30,
          date_picker_height = 12,
        },
        storage = {
          file_format = "json",
          tasks_subdir = "tasks",
          notes_subdir = "notes",
        },
        export = {
          default_format = "markdown",
          export_dir = vim.fn.expand "~/exported_notes",
        },
        keymaps = {
          open_menu = "<leader>fn", -- Open main menu (Notes)
          new_task = "<leader>ft", -- New Task (Task)
          browse_tasks = "<leader>fl", -- List Tasks (List)
        },
      }
    end,
  },
  -- nvim-gemini-companion (merged duplicate entry, using Qwen as default)
  {
    "gutsavgupta/nvim-gemini-companion",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
      require("gemini").setup {
        model = "qwen", -- Use Qwen as default model
        cmds = { "qwen" },
        win = {
          preset = "right-fixed",
          width = 0.4,
          height = 0.8,
        },
      }
    end,
  },
  -- LSP Saga
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" },
      { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
      require("lspsaga").setup {
        symbol_in_winbar = {
          enable = true,
          separator = " › ",
          hide_keyword = true,
          show_file = true,
          folder_level = 2,
          color_mode = true,
        },
        lightbulb = {
          enable = false,
        },
      }
    end,
  },
  -- Smear cursor
  {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",
    cond = vim.g.neovide == nil,
    opts = {
      cursor_color = "#FFFFFF",
      smear_between_buffers = false,
      smear_between_neighbor_lines = true,
      smear_insert_mode = true,
      stiffness = 0.5,
      trailing_stiffness = 0.6,
      damping = 0.7,
      trailing_exponent = 2.0,
      distance_stop_animating = 0.02,
      time_interval = 10,
      legacy_computing_symbols_support = false,
    },
  },
  -- Alpha dashboard
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
    end,
  },
  -- Colorizer
  {
    "NvChad/nvim-colorizer.lua",
    event = "VeryLazy",
    opts = {
      filetypes = { "*", "!lazy" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true, -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = true, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features
        css_fn = true, -- Enable all CSS *functions*
      },
    },
  },
  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  -- Floaterm
  {
    "nvzone/floaterm",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = "FloatermToggle",
  },
  -- opencode.nvim
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
    },
    opts = {},
  },
  -- Buffer-sticks
  {
    "ahkohd/buffer-sticks.nvim",
    opts = {},
  },
  -- CMP Configuration
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require "configs.cmp"
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.defer_fn(function()
            local ok, cmp = pcall(require, "cmp")
            if not ok then
              return
            end
            pcall(function()
              cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                  { name = "buffer" },
                },
              })
            end)
            pcall(function()
              cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                  { name = "cmdline" },
                  { name = "path" },
                },
              })
            end)
          end, 100)
        end,
        once = true,
      })
    end,
  },
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        opts = {
          automatic_installation = true,
        },
      },
      "williamboman/mason.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require "configs.lspconfig"
    end,
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
    },
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "scss",
        "tsx",
        "typescript",
        "graphql",
        "http",
        "dockerfile",
        "yaml",
        "toml",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "php",
        "blade",
        "python",
        "rust",
        "go",
        "sql",
        "prisma",
        "c",
        "cpp",
        "make",
        "vim",
        "vimdoc",
        "query",
        "regex",
        "comment",
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
  },
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require "configs.telescope"
    end,
  },
  -- NvimTree
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeOpen" },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {
        view = {
          width = 30,
          side = "left",
        },
        renderer = {
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
        on_attach = function(bufnr)
          local api = require "nvim-tree.api"
          local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end
          api.config.mappings.default_on_attach(bufnr)
          vim.keymap.set("n", "l", function()
            local node = api.tree.get_node_under_cursor()
            if node then
              if (node.type == "directory" and not node.open) or (node.type == "file") then
                api.node.open.edit(node)
              elseif node.type == "directory" and node.open then
                api.node.navigate.sibling.next(node)
              end
            end
          end, opts "Open file/folder or next sibling")
          vim.keymap.set("n", "h", function()
            local node = api.tree.get_node_under_cursor()
            if node then
              if node.type == "directory" and node.open then
                api.node.navigate.sibling.prev(node)
              else
                api.node.navigate.parent_close()
              end
            end
          end, opts "Close folder or prev sibling")
        end,
      }
    end,
  },
  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = true,
  },
  -- WhichKey
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  -- Formatting
  {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.conform"
    end,
  },
  -- Dressing
  {
    "stevearc/dressing.nvim",
    config = true,
  },
  -- Barbar
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {},
    version = "^1.0.0",
  },
  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  -- Comment
  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },
  -- Mini.nvim
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.animate").setup()
      require("mini.pairs").setup()
      require("mini.surround").setup()
      require("mini.trailspace").setup()
    end,
  },
  -- Treesitter Context
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {},
  },
  -- TS Autotag
  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },
  -- Nvim UFO
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    opts = {},
  },
  -- Promise Async
  {
    "kevinhwang91/promise-async",
  },
  -- Snacks
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {},
  },
  -- Tailwind Tools
  {
    "luckasRanarison/tailwind-tools.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
  },
  -- Telescope File Browser
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
  -- Noice
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
    },
  },
  -- Notify
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
  -- Trouble
  {
    "folke/trouble.nvim",
    opts = {
      auto_preview = false,
      auto_fold = false,
      auto_jump = { "lsp_definitions" },
      signs = {
        error = "",
        warning = "",
        hint = "󰌵",
        information = "",
        other = "",
      },
    },
    cmd = { "TroubleToggle", "Trouble" },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Diagnostics (Trouble)" },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Workspace Diagnostics (Trouble)" },
      { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Document Diagnostics (Trouble)" },
    },
  },
  -- Tiny Inline Diagnostic
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    dependencies = {
      "rcarriga/nvim-notify",
    },
    opts = {},
    config = function(_, opts)
      require("tiny-inline-diagnostic").setup(opts)
    end,
  },

  -- Plugin: store.nvim
  {
    "alex-popov-tech/store.nvim",
    lazy = true,
    cmd = { "Store" },
    dependencies = { "OXY2DEV/markview.nvim" },
    opts = {},
  },
}
