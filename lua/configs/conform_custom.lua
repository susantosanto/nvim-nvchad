local M = {}

M.setup = function()
  local conform = require("conform")

  conform.setup({
    formatters_by_ft = {
      lua = { "stylua" },
      css = { "prettier" },
      scss = { "prettier" },
      html = { "prettier" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
      php = { "php_cs_fixer" },
      prisma = { "prettier" },
    },

    -- Configure formatters with appropriate options
    formatters = {
      prettier = {
        -- Prettier options to ensure semicolons are added
        prepend_args = { "--semi=true", "--trailing-comma=es5" },
      },
      stylua = {
        -- Explicitly configure stylua options to avoid conflicts with .stylua.toml
        prepend_args = {},
      },
    },

    -- Don't use format_on_save to avoid conflicts with autosave
    format_on_save = false,
  })

  -- Custom autocommand that formats on explicit saves only
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
      -- Format only if the buffer is modifiable and modified
      if vim.bo.modifiable and vim.bo.modified then
        -- Check if this is a manually triggered save by examining the command
        -- Using vim.v.command or checking specific conditions might help 
        -- but for now, we'll format on all BufWritePre except for specific cases
        require("conform").format({
          async = true,
          lsp_fallback = true,
        })
      end
    end,
    desc = "Format on save",
  })
end

return M