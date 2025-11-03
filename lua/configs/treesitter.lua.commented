-- TreeSitter configuration with error handling to prevent 'end_col out of range' errors
local M = {}

M.setup = function()
  -- Override nvim_buf_set_extmark to handle TreeSitter highlighting errors
  -- This is a more targeted approach than the global override in init.lua
  local has_treesitter, ts_config = pcall(require, "nvim-treesitter.configs")
  if not has_treesitter then
    return
  end

  ts_config.setup {
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
      -- "graphql",
      "http",
      "dockerfile",
      "yaml",
      "toml",
      -- "git_config",
      -- "git_rebase",
      -- "gitattributes",
      -- "gitcommit",
      -- "gitignore",
      "php",
      "blade",
      -- "python",
      -- "rust",
      -- "go",
      "sql",
      "prisma",
      -- "c",
      -- "cpp",
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
      -- Disable highlighting for certain file types to prevent errors
      disable = function(lang, buf)
        local disable_filetypes = {
          "dashboard",
          "TelescopePrompt",
          "TelescopeResults",
          "lazy",
          "mason",
          "help",
          "startify",
          "nvcheatsheet",
          "lspinfo",
          "null-ls-info",
          "toggleterm",
          "terminal",
          "alpha",
          "NvimTree",
          "neo-tree",
          "undotree",
          "gitsigns",
          "which-key",
          "noice",
          "notify",
          "",
        }

        local current_ft = vim.api.nvim_buf_get_option(buf, "filetype")
        local current_bt = vim.api.nvim_buf_get_option(buf, "buftype")

        -- Disable if buftype is special (like terminal, prompt, etc.)
        if current_bt ~= "" and current_bt ~= "acwrite" then
          return true
        end

        for _, ft in ipairs(disable_filetypes) do
          if current_ft == ft then
            return true
          end
        end

        -- Also disable for very large files to prevent performance issues
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end

        return false
      end,
    },
    indent = {
      enable = true,
      -- Disable indentation for certain file types to prevent errors
      disable = function(lang, buf)
        local disable_filetypes = {
          "dashboard",
          "TelescopePrompt",
          "TelescopeResults",
          "lazy",
          "mason",
          "help",
          "startify",
          "nvcheatsheet",
          "lspinfo",
          "null-ls-info",
          "toggleterm",
          "terminal",
          "alpha",
          "NvimTree",
          "neo-tree",
          "undotree",
          "gitsigns",
          "which-key",
          "noice",
          "notify",
          "",
        }

        local current_ft = vim.api.nvim_buf_get_option(buf, "filetype")
        local current_bt = vim.api.nvim_buf_get_option(buf, "buftype")

        -- Disable if buftype is special
        if current_bt ~= "" and current_bt ~= "acwrite" then
          return true
        end

        for _, ft in ipairs(disable_filetypes) do
          if current_ft == ft then
            return true
          end
        end

        return false
      end,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["at"] = "@statement.outer",
          ["it"] = "@statement.inner",
          ["as"] = "@scope",
          ["is"] = "@scope",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["ai"] = "@conditional.outer",
          ["ii"] = "@conditional.inner",
          ["ad"] = "@comment.outer",
          ["id"] = "@comment.inner",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>na"] = "@parameter.inner",
          ["<leader>nf"] = "@function.outer",
          ["<leader>nc"] = "@class.outer",
        },
        swap_previous = {
          ["<leader>pa"] = "@parameter.inner",
          ["<leader>pf"] = "@function.outer",
          ["<leader>pc"] = "@class.outer",
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
    },
  }
end

return M