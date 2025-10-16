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
        default_note_dir = "/mnt/c/Users/XCODE/Documents/Obsidian/My Note", -- Set ke vault Obsidian yang sebenarnya
        obsidian_path = "/mnt/c/Users/XCODE/Documents/Obsidian/My Note", -- Set jika pakai Obsidian vault
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
      require("configs.conform_custom").setup()
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
      require("mini.files").setup()
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
  -- Git Fugitive
  {
    "tpope/vim-fugitive",
    cmd = {
      "Git",
      "G",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
    },
    keys = {
      { "<leader>gg", "<cmd>Git<CR>", desc = "Fugitive Git Status" },
      { "<leader>gc", "<cmd>Git commit<CR>", desc = "Git Commit" },
      { "<leader>gp", "<cmd>Git push<CR>", desc = "Git Push" },
      { "<leader>gl", "<cmd>Git log<CR>", desc = "Git Log" },
      { "<leader>gL", "<cmd>Git log --oneline<CR>", desc = "Git Log (oneline)" },
      { "<leader>gb", "<cmd>Git branch<CR>", desc = "Git Branch" },
      { "<leader>gd", "<cmd>Gdiffsplit<CR>", desc = "Git Diff" },
      { "<leader>gr", "<cmd>Git rename<CR>", desc = "Git Rename" },
      { "<leader>gR", "<cmd>Git reset HEAD<CR>", desc = "Git Reset HEAD" },
      { "<leader>gs", "<cmd>Git stash<CR>", desc = "Git Stash" },
    },
  },
  -- Enhanced folding with treesitter and LSP integration
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      -- Enable better folding
      vim.o.foldcolumn = '1'
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

      require('ufo').setup({
        open_fold_hl_timeout = 150,
        close_fold_hl_timeout = 150,
        provider_selector = function(bufnr, filetype, buftype)
          return { 'treesitter', 'indent' }
        end,
        preview = {
          win_config = {
            border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
            winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
            winblend = 0
          },
          mappings = {
            close = 'q',
            switch = 's',
            trace = 'r'
          }
        }
      })

      -- Create commands for enabling/disabling ufo
      vim.api.nvim_create_user_command('UfoEnable', function()
        vim.o.foldenable = true
        vim.notify('UFO folding enabled', vim.log.levels.INFO)
      end, {})
      
      vim.api.nvim_create_user_command('UfoDisable', function()
        vim.o.foldenable = false
        vim.notify('UFO folding disabled', vim.log.levels.INFO)
      end, {})
    end,
  },

  -- Promise Async
  {
    "kevinhwang91/promise-async",
  },
  -- Snacks (without notification override since using nvim-notify)
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      hints = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      dashboard = { enabled = false }, -- Disable if using alpha dashboard
      indent = { enabled = true },
      progress = { enabled = true },
      scope = { enabled = true },
      statusline = { enabled = true },
    },
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
  -- Modern notification system
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
      timeout = 3000,
      max_width = 80,
      max_height = 20,
      stages = "fade_in_slide_out",
      top_padding = 2,
      icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
      },
      render = "default",
      position = "top_right",
    },
    init = function()
      -- Override default vim.notify with nvim-notify
      vim.notify = require("notify")
    end,
  },
  -- Dotenv
  {
    "ellisonleao/dotenv.nvim",
    priority = 1000,
    config = true,
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
  -- Tiny Code Action
  {
    "rachartier/tiny-code-action.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      -- Use default options or customize as needed
    },
    keys = {
      {
        "<leader>ca",
        function()
          require("tiny-code-action").code_action()
        end,
        mode = { "n", "v" },
        desc = "Code Action (Tiny)",
      },
      {
        "<leader>ca",
        function()
          require("tiny-code-action").range_code_action()
        end,
        mode = "v",
        desc = "Range Code Action (Tiny)",
      },
    },
  },

  -- Plugin: store.nvim
  {
    "alex-popov-tech/store.nvim",
    lazy = true,
    cmd = { "Store" },
    dependencies = { "OXY2DEV/markview.nvim" },
    opts = {},
  },
  -- Visual feedback for undo, redo, yank, paste, search operations
  {
    "y3owk1n/undo-glow.nvim",
    event = "VeryLazy", -- Load on startup
    config = function()
      require("configs.undo-glow").setup()
    end,
  },
  -- Automatic sorting of Tailwind CSS classes
  {
    "y3owk1n/tailwind-autosort.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("configs.tailwind-autosort").setup()
    end,
  },
  -- Typing practice plugin
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },
  -- Auto save plugin
  {
    "brianhuster/autosave.nvim",
    event = "VeryLazy",
    config = function()
      vim.g.autosave_enabled = true
      vim.g.autosave_disable_inside_paths = { vim.fn.stdpath('config') }
      -- Disable autowriteall to avoid conflicts with other plugins
      vim.o.autowriteall = false
    end,
  },
}
