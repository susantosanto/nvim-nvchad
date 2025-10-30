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
      require("fknotes").setup({
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
          export_dir = vim.fn.expand("~/exported_notes"),
        },
        keymaps = {
          open_menu = "<leader>fn", -- Open main menu (Notes)
          new_task = "<leader>ft", -- New Task (Task)
          browse_tasks = "<leader>fl", -- List Tasks (List)
        },
      })
    end,
  },
  -- nvim-gemini-companion (merged duplicate entry, using Qwen as default)
  {
    "gutsavgupta/nvim-gemini-companion",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
      require("gemini").setup({
        model = "qwen", -- Use Qwen as default model
        cmds = { "qwen" },
        win = {
          preset = "right-fixed",
          width = 0.4,
          height = 0.8,
        },
      })
    end,
  },
  -- LSP Saga (disabled to prevent hover conflicts)
  -- {
  --   "nvimdev/lspsaga.nvim",
  --   event = "LspAttach",
  --   dependencies = {
  --     { "nvim-treesitter/nvim-treesitter" },
  --     { "nvim-tree/nvim-web-devicons" },
  --   },
  --   config = function()
  --     require("lspsaga").setup({
  --       symbol_in_winbar = {
  --         enable = true,
  --         separator = " › ",
  --         hide_keyword = true,
  --         show_file = true,
  --         folder_level = 2,
  --         color_mode = true,
  --       },
  --       lightbulb = {
  --         enable = false,
  --       },
  --       hover = {
  --         enable = false, -- Nonaktifkan hover otomatis yang menyebabkan mode switching
  --       },
  --       signature_help = {
  --         enable = false, -- Nonaktifkan signature help otomatis
  --         show_active_signature = false,
  --       },
  --       definition = {
  --         enable = false, -- Nonaktifkan definition preview otomatis
  --       },
  --       rename = {
  --         enable = true,
  --         in_select = false,
  --       },
  --       diagnostic = {
  --         enable = true,
  --         show_code_action = true,
  --         show_source = true,
  --         border = true,
  --         max_width = 60,
  --       },
  --     })
  --   end,
  -- },
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
      stiffness = 0.1, -- Very flexible (very low stiffness)
      trailing_stiffness = 0.15, -- Low for maximum trailing effect
      damping = 0.3, -- Low damping for more trailing
      trailing_exponent = 1.0, -- Lower for smoother, more trailing effect
      distance_stop_animating = 0.005, -- Animate for even longer distance
      time_interval = 5, -- Faster animation for smoother effect
      legacy_computing_symbols_support = false,
    },
  },
  -- Dashboard-nvim (modern dashboard)
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("configs.alpha_center")
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
      require("configs.cmp")
      -- Setup cmdline completion for search
      require("cmp").setup.cmdline({ "/", "?" }, {
        mapping = require("cmp").mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
        -- Enable automatic completion for search
        completion = {
          completeopt = "menu,menuone,noselect",
        },
      })

      -- Setup cmdline completion for command mode
      require("cmp").setup.cmdline(":", {
        mapping = require("cmp").mapping.preset.cmdline(),
        sources = {
          { name = "path" },
          { name = "cmdline" },
        },
        -- Enable automatic completion for commands
        completion = {
          completeopt = "menu,menuone,noselect",
        },
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
      require("configs.lspconfig")
    end,
  },
  -- Linting support for web development
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        vue = { "eslint_d" },
        svelte = { "eslint_d" },
        python = { "flake8" },
        php = { "phpcs" },
      }
      -- Auto-run linter on file changes, but optimize for performance
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          -- Only run linting on file save, not on BufEnter which can cause performance issues
          lint.try_lint()
        end,
      })
    end,
  },
  -- Formatters for web development
  {
    "stevearc/conform.nvim",
    event = "BufReadPre",
    config = function()
      require("configs.conform_custom").setup()
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
    config = function()
      require("configs.treesitter").setup()
    end,
  },

  -- Treesitter Textobjects: Additional configuration
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    enabled = false, -- Already configured as dependency above
  },
  -- Treesitter Textobjects: Additional configuration
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    enabled = false, -- Already configured as dependency above
  },

  {
    "jose-elias-alvarez/typescript.nvim",
    opts = {
      disable_commands = false, -- prevent the plugin from creating commands
      debug = false, -- enable debug logging for commands
      go_to_source_definition = {
        fallback = true, -- fall back to standard LSP definition on failure
      },
      server = { -- pass options to lspconfig's setup method
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      },
    },
  },

  -- Volar for Vue.js development
  {
    "vuejs/language-tools",
    ft = "vue",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("lspconfig").volar.setup({
        filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" },
        init_options = {
          vue = {
            hybridMode = false,
          },
        },
      })
    end,
  },

  -- Visual-Multi: Multi cursor seperti di VS Code
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    init = function()
      -- Konfigurasi VM
      vim.g.VM_mouse_mappings = 1
      vim.g.VM_default_mappings = 0 -- Disable default mappings to avoid conflicts
      vim.g.VM_leader = "\\"
      vim.g.VM_maps = {
        ["Find Under"] = "<M-d>", -- Use Ctrl+n (common for finding next occurrence)
        ["Find Subword Under"] = "<M-d>", -- Same as Find Under
        ["Select Cursor Down"] = "<C-Down>", -- Use Ctrl+Arrow Down (ergonomic for adding cursors)
        ["Select Cursor Up"] = "<C-Up>", -- Use Ctrl+Arrow Up
        ["Skip Region"] = "<M-n>", -- Use Ctrl+Arrow Right
        ["Remove Region"] = "<M-p>", -- Use Ctrl+Backspace (doesn't conflict with existing mappings)
      }
    end,
  },

  -- Lspkind: VS Code-like pictograms for completion items
  {
    "onsails/lspkind.nvim",
    opts = {
      mode = "symbol",
      preset = "default",
      symbol_map = {
        Text = "󰉿",
        Method = "󰊕",
        Function = "󰊕",
        Constructor = "",
        Field = "󰜢",
        Variable = "󰀫",
        Class = "󰠱",
        Interface = "",
        Module = "󰕳",
        Property = "󰖷",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "󰩫",
        -- Color = "󰏘",
        File = "󰈙",
        Reference = "󰈥",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "󰊄",
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
      require("configs.telescope")
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
      require("nvim-tree").setup({
        view = {
          width = 30,
          side = "left",
          relativenumber = false,
          float = {
            enable = false,
            quit_on_focus_loss = true,
            open_win_config = {
              relative = "editor",
              border = "none",  -- Make border transparent/none
              width = 30,
              height = 30,
              row = 1,
              col = 1,
            },
          },
        },
        renderer = {
          add_trailing = false,
          group_empty = false,
          highlight_git = true,
          highlight_opened_files = "none",
          root_folder_label = ":t",
          indent_width = 2,
          indent_markers = {
            enable = false,
          },
          special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "package.json" },
          symlink_destination = true,
          icons = {
            web_devicons = {
              file = {
                enable = true,
                color = true,
              },
              folder = {
                enable = true,
              },
            },
            show = {
              file = true,
              folder = true,
              folder_arrow = false, -- Remove the arrow indicators
              git = true,
            },
            glyphs = {
              default = "󰈚",
              symlink = "",
              bookmark = "󰆤",
              folder = {
                arrow_closed = "", -- Empty string to remove arrows
                arrow_open = "",
                default = "󰉋",
                open = "󰍁",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "󰉉",
              },
              git = {
                untracked = "󰞋",
                deleted = "󰍵",
                renamed = "󰍿",
                unmerged = "󰍴",
                staged = "󰍶",
                ignored = "󰍷",
              },
            },
          },
        },
        filters = {
          dotfiles = false,
          custom = { ".git" },
        },
        git = {
          enable = true,
          ignore = false,
          show_on_dirs = true,
          show_on_open_dirs = true,
          timeout = 400,
        },
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")
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
          end, opts("Open file/folder or next sibling"))
          vim.keymap.set("n", "h", function()
            local node = api.tree.get_node_under_cursor()
            if node then
              if node.type == "directory" and node.open then
                api.node.navigate.sibling.prev(node)
              else
                api.node.navigate.parent_close()
              end
            end
          end, opts("Close folder or prev sibling"))
        end,
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signs_staged = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signs_staged_enable = true,
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          interval = 1000,
          follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000,
        preview_config = {
          -- Options passed to nvim_open_win
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
        on_attach = function(bufnr)
          local gitsigns = require("gitsigns")

          local function map(mode, l, r, opts)
            opts = vim.tbl_extend("force", opts or {}, { buffer = bufnr })
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then
              return "]c"
            end
            vim.schedule(function()
              gitsigns.next_hunk()
            end)
            return "<Ignore>"
          end, { expr = true, desc = "Next git hunk" })

          map("n", "[c", function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(function()
              gitsigns.prev_hunk()
            end)
            return "<Ignore>"
          end, { expr = true, desc = "Previous git hunk" })

          -- Actions
          map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
          map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
          map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Stage buffer" })
          map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "Undo stage hunk" })
          map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset buffer" })
          map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview hunk" })
          map("n", "<leader>gb", function()
            gitsigns.blame_line({ full = true })
          end, { desc = "Blame line" })
          map("n", "<leader>gB", gitsigns.toggle_current_line_blame, { desc = "Toggle line blame" })
          map("n", "<leader>gd", gitsigns.diffthis, { desc = "Diff this" })
          map("n", "<leader>gD", function()
            gitsigns.diffthis("~")
          end, { desc = "Diff this against HEAD~" })
          map("n", "<leader>gt", gitsigns.toggle_deleted, { desc = "Toggle deleted" })

          -- Text object
          map({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select git hunk" })
        end,
      })
    end,
  },
  -- WhichKey
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = require("configs.which-key"),
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
  -- TS Autotag: Auto close HTML/XML tags
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        autotag = {
          enable = true,
          filetypes = {
            "html",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "svelte",
            "vue",
            "tsx",
            "jsx",
            "xml",
            "php",
            "handlebars",
          },
        },
      })
    end,
  },
  -- Surround: Better text objects for HTML/XML tags
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        surrounds = {
          ["t"] = {
            -- Custom HTML tag surround
            add = function()
              local tagName = vim.fn.input("Tag name: ")
              return { { "<" .. tagName .. ">" }, { "</" .. tagName .. ">" } }
            end,
          },
        },
        aliases = {
          ["h"] = "t", -- HTML tag alias
        },
      })
    end,
  },
  -- Rainbow: Highlight matching HTML/XML tags
  {
    "HiPhish/nvim-ts-rainbow2",
    event = "VeryLazy",
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
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

      require("ufo").setup({
        open_fold_hl_timeout = 150,
        close_fold_hl_timeout = 150,
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
        preview = {
          win_config = {
            border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
            winblend = 0,
          },
          mappings = {
            close = "q",
            switch = "s",
            trace = "r",
          },
        },
      })

      -- Create commands for enabling/disabling ufo
      vim.api.nvim_create_user_command("UfoEnable", function()
        vim.o.foldenable = true
        vim.notify("UFO folding enabled", vim.log.levels.INFO)
      end, {})

      vim.api.nvim_create_user_command("UfoDisable", function()
        vim.o.foldenable = false
        vim.notify("UFO folding disabled", vim.log.levels.INFO)
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
        hover = {
          enable = false, -- Nonaktifkan hover documentation otomatis
        },
        signature = {
          enable = false, -- Nonaktifkan signature help otomatis
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },
      },
      -- Modern command line UI at bottom (like search)
      cmdline = {
        enabled = true,
        view = "cmdline", -- Use bottom-style cmdline like search
        format = {
          cmd = { icon = "➤" }, -- Arrow icon - more compatible but distinctive
          search_down = { icon = "🔍 ▼" },
          search_up = { icon = "🔍 ▲" },
          filter = { icon = "$" },
          lua = { icon = "🌙" },
          input = {},
        },
      },
      -- Messages and other UI elements at bottom like search
      messages = {
        enabled = true,
        view = "mini", -- Minimalist message view at bottom
      },
      -- Popup menu configuration for modern look
      popupmenu = {
        enabled = true,
        backend = "nui",
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

  -- Tiny Inline Diagnostic
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    dependencies = {
      "rcarriga/nvim-notify",
    },
    config = function()
      require("configs.tiny_inline_diagnostic").setup()
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
      vim.g.autosave_enabled = false
      vim.g.autosave_disable_inside_paths = { vim.fn.stdpath("config") }
      -- Disable autowriteall to avoid conflicts with other plugins
      vim.o.autowriteall = false
    end,
  },

  -- Markdown preview plugin (lightweight)
  {
    "OXY2DEV/markview.nvim",
    ft = "markdown", -- Load only when opening markdown files
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("markview").setup({
        -- Minimal configuration for lightweight performance
        modes = { "n", "i" }, -- Enable in normal and insert mode

        -- Performance optimizations
        cache = {
          enabled = true, -- Enable caching for better performance
        },

        -- UI options (minimal for lightweight use)
        ui = {
          code = {
            enabled = true, -- Show code block decorations
          },
        },
      })
    end,
  },
  -- Close Buffers
  {
    "kazhala/close-buffers.nvim",
    config = function()
      require("close_buffers").setup({
        filetype_ignore = {}, -- Filetype to ignore when running deletions
        file_glob_ignore = {}, -- File name glob pattern to ignore when running deletions
        file_regex_ignore = {}, -- File name regex pattern to ignore when running deletions
        preserve_window_layout = { "this", "nameless" }, -- Types of deletion that should preserve the window layout
        next_buffer_cmd = nil, -- Custom function to retrieve the next buffer when preserving window layout
      })
    end,
  },
  -- Prisma support
  {
    "dastanaron/prisma.nvim",
    ft = "prisma",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("prisma").setup({
        -- Optional settings with their defaults
        -- log_level = "info", -- Options: "error", "warn", "info", "debug"
        -- lsp = {
        --   on_attach = function(client, bufnr)
        --     -- Your on_attach function if needed
        --   end,
        --   flags = { debounce_text_changes = 150 },
        -- },
        -- show_line_numbers_on_hover_hint = false,
        -- show_variable_references_on_hover = false,
      })
    end,
  },

  -- Indent blankline: Show indentation guides (minimized)
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "", -- Empty character to make indent guides invisible
      },
      whitespace = {
        remove_blankline_trail = true,
      },
      scope = {
        char = "",
        show_start = false,
        show_end = false,
      },
      exclude = {
        buftypes = {
          "terminal",
          "nofile",
          "prompt",
        },
        filetypes = {
          "help",
          "startify",
          "dashboard",
          "lazy",
          "neogitstatus",
          "NvimTree",
          "Trouble",
          "text",
          "markdown",
          "json",
          "txt",
        },
      },
    },
  },
  -- Twilight: Reduce visual clutter in surrounding context
  {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup({
        dimming = {
          alpha = 0.25, -- Amount of dimming
          color = { "Normal", "#ffffff" }, -- CSS color / highlight group / list of colors
          term_bg = "#000000", -- Blends the terminal background
          inactive = false, -- When true, other windows are not dimmed
        },
        expansion = {
          larger = false, -- Expand more than one level for the specified filetype
        },
        target = { -- Treesitter nodes or regex highlights
          "comment",
          "function",
          "method",
          "class",
          "conditional",
          "loop",
          "try",
          "except",
          "arguments",
          "attribute",
        },
        exclude = {}, -- Exclude these filetypes
      })
    end,
  },
  -- Telescope Media Files: Preview media files in telescope
  {
    "nvim-telescope/telescope-media-files.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").load_extension("media_files")
    end,
  },
  -- Undotree: Visualize undo history
  {
    "jiaoshijie/undotree",
    priority = 1000, -- Load very early
    config = function()
      require("undotree").setup({})
    end,
    keys = {
      { "<leader>U", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undotree" },
    },
  },
  -- Dropbar.nvim - Breadcrumbs like VS Code/ JetBrains
  {
    "Bekaboo/dropbar.nvim",
    event = "VeryLazy",
    opts = {
      icons = {
        enabled = true,
        -- Use VS Code/ JetBrains style icons
        kinds = {
          File = { icon = "󰈙", hl = "dropbarFile" },
          Module = { icon = "󰕳", hl = "dropbarModule" },
          Namespace = { icon = "󰅪", hl = "dropbarNamespace" },
          Package = { icon = "󰏗", hl = "dropbarPackage" },
          Class = { icon = "󰠱", hl = "dropbarClass" },
          Method = { icon = "󰊕", hl = "dropbarMethod" },
          Property = { icon = "󰖷", hl = "dropbarProperty" },
          Field = { icon = "󰜢", hl = "dropbarField" },
          Constructor = { icon = "", hl = "dropbarConstructor" },
          Enum = { icon = "", hl = "dropbarEnum" },
          Interface = { icon = "", hl = "dropbarInterface" },
          Function = { icon = "󰊕", hl = "dropbarFunction" },
          Variable = { icon = "󰀫", hl = "dropbarVariable" },
          Constant = { icon = "󰏿", hl = "dropbarConstant" },
          String = { icon = "󰉾", hl = "dropbarString" },
          Number = { icon = "󰎠", hl = "dropbarNumber" },
          Boolean = { icon = "󰨙", hl = "dropbarBoolean" },
          Array = { icon = "󰅪", hl = "dropbarArray" },
          Object = { icon = "󰅩", hl = "dropbarObject" },
          Key = { icon = "󰌋", hl = "dropbarKey" },
          Null = { icon = "󰟢", hl = "dropbarNull" },
          EnumMember = { icon = "", hl = "dropbarEnumMember" },
          Struct = { icon = "󰙅", hl = "dropbarStruct" },
          Event = { icon = "", hl = "dropbarEvent" },
          Operator = { icon = "󰆕", hl = "dropbarOperator" },
          TypeParameter = { icon = "󰊄", hl = "dropbarTypeParameter" },
        },
      },
      bar = {
        -- Enable breadcrumbs in winbar
        enable = function(buf)
          return vim.api.nvim_buf_get_option(buf, "buftype") == ""
        end,
      },
    },
  },
  -- Nvim-biscuits: Show context at the end of long lines
  {
    "code-biscuits/nvim-biscuits",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      -- Konfigurasi global default
      default_config = {
        max_length = 12, -- Panjang maksimum sebelum ditampilkan
        min_distance = 5, -- Jarak minimum sebelum ditampilkan
        prefix_string = " 📎 ", -- Awalan default untuk teks yang dipersingkat
      },
      -- Konfigurasi spesifik bahasa
      language_config = {
        javascript = {
          prefix_string = " ⚡ ", -- Ikon khusus untuk javascript
          max_length = 80,
        },
        typescript = {
          prefix_string = " 🔷 ", -- Ikon khusus untuk typescript
          max_length = 80,
        },
        python = {
          disabled = false, -- Aktifkan untuk python
          prefix_string = " 🐍 ", -- Ikon untuk python
        },
        lua = {
          prefix_string = " 🌙 ", -- Ikon untuk lua
        },
        html = {
          prefix_string = " 🌐 ", -- Ikon untuk html
        },
        css = {
          prefix_string = " 🎨 ", -- Ikon untuk css
        },
        vue = {
          prefix_string = " ▿ ", -- Ikon untuk vue
        },
      },
      -- Update hanya saat meninggalkan mode insert atau kursor ditahan lama
      update_events = { "InsertLeave", "CursorHoldI" },
    },
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Moveline: Move lines with Alt+j/k (will override existing mappings)
  {
    "willothy/moveline.nvim",
    priority = 1000,
    enabled = true,
    build = "make",
    config = true,
  },

  -- Todo Comments: Highlight, list and search todo comments in your files
  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = true, -- show icons in the signs column
      sign_priority = 8, -- sign priority
      -- keywords recognized as todo comments
      keywords = {
        FIX = {
          icon = "󰓛", -- fixed: square root symbol
          color = "error",
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that are treated like this keyword
        },
        TODO = { icon = "󰗡", color = "info" }, -- task: checkmark
        HACK = { icon = "󰊖", color = "warning" }, -- tool: hammer and pick
        WARN = { icon = "󰀪", color = "warning", alt = { "WARNING", "XXX" } }, -- warning: warning sign
        PERF = { icon = "󰾅", color = "hint", alt = { "OPTIMIZE", "PERFORMANCE", "BENCH", "BENCHMARK" } }, -- performance: fast up arrow
        NOTE = { icon = "󰍨", color = "hint", alt = { "INFO", "IDEA" } }, -- note: lightbulb
        TEST = { icon = "󰄵", color = "test", alt = { "TESTING", "PASSED", "FAILED" } }, -- test: beaker
      },
      -- highlighting of the line containing the todo comment
      highlight = {
        multiline = true, -- enable multine todo comments
        multiline_pattern = "^.", -- match any character at the beginning of the line
        multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
        before = "", -- "fg" or "bg" or empty
        keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty.
        after = "fg", -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
        comments_only = true, -- uses treesitter to match keywords in comments only
        max_line_len = 400, -- ignore lines longer than this
        exclude = {}, -- list of file types to exclude highlighting
      },
      -- list of named colors where we try to extract the guifg from the
      -- list of highlight groups or use the hex color if hl not found as a fallback
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#F59E0B" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        test = { "DiagnosticOk", "#7C3AED" },
      },
      search = {
        command = "grep",
        args = {
          "--color=never",
          "--no-group-separator",
          "--line-number",
          "--recursive",
          "--exclude-dir=node_modules",
          "--include=*.lua",
          "--include=*.js",
          "--include=*.ts",
          "--include=*.tsx",
          "--include=*.py",
          "--include=*.html",
          "--include=*.css",
          "--include=*.json",
          "--include=*.md",
          "--include=*.yaml",
          "--include=*.yml",
          "--include=*.php",
          "--include=*.go",
          "--include=*.rb",
          "--include=*.java",
          "--include=*.rs",
          "--include=*.cpp",
          "--include=*.c",
          "--include=*.h",
        },
        -- regex that will be used to match keywords.
        -- all separate keywords that are found will be
        -- highlighted in the file and matched in the search results
        pattern = [[\b(KEYWORDS)\b]], -- ripgrep regex
      },
    },
    -- Keymaps for todo-comments functionality
    keys = {
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next todo comment",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous todo comment",
      },
      { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todo comments" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Search todo comments" },
    },
  },
  -- Beacon: Highlight cursor movements for better visibility
  {
    "DanilaMihailov/beacon.nvim",
    event = "VeryLazy", -- Load on startup for immediate use
  },
}
