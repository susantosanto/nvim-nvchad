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
      vue = { "prettier" },
      svelte = { "prettier" },
      astro = { "prettier" },
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

    -- Use format_on_save with lsp_fallback to avoid conflicts with manual formatting
    format_on_save = {
      timeout_ms = 1000,
      lsp_fallback = true,
    },
  })
end

return M