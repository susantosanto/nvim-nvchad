local options = {
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

  -- Disable automatic format on save to avoid conflicts with autosave
  -- Instead, we'll use a custom autocommand that only formats on explicit saves
  format_on_save = false,
}

return options
