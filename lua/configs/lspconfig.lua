-- Load NvChad defaults
local nvchad_lsp = require("nvchad.configs.lspconfig")
local on_attach = nvchad_lsp.on_attach
local capabilities = nvchad_lsp.capabilities

-- Additional on_attach function to add keymaps
local on_attach_with_keymaps = function(client, bufnr)
  on_attach(client, bufnr)
  
  -- Don't set up keymaps if server doesn't support them
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fm', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', { 
      desc = "Format file", 
      noremap = true, 
      silent = true 
    })
  end
end

-- Define servers to configure for fullstack development
-- Will handle JS/TS diagnostics primarily via lint.nvim to prevent duplication
local servers = {
  "html",
  "cssls", 
  "jsonls",
  "bashls",
  "denols",         -- Deno
  "emmet_ls",       -- HTML/CSS emmet
  "tailwindcss",    -- Tailwind CSS
  "lua_ls",         -- Lua (for Neovim config)
  "dockerls",       -- Docker
  "yamlls",         -- YAML files
}

-- Add specific JavaScript/TypeScript server that doesn't conflict with ESLint
-- We'll only add ts_ls without diagnostic capabilities when using lint.nvim
local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if mason_lspconfig_ok then
  -- Use the new approach with handlers
  mason_lspconfig.setup({
    ensure_installed = servers,
    handlers = {
      -- Default handler for all servers
      function(server_name)
        local lspconfig = require("lspconfig")
        local opts = {
          on_attach = on_attach_with_keymaps,
          capabilities = capabilities,
        }
        
        if server_name == "denols" then
          opts.root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc", ".git")
          opts.single_file_support = false
        elseif server_name == "emmet_ls" then
          opts.filetypes = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte", "vue", "astro", "blade" }
        elseif server_name == "tailwindcss" then
          opts.root_dir = lspconfig.util.root_pattern("tailwind.config.js", "tailwind.config.ts", "postcss.config.js", "postcss.config.ts", "package.json", ".git")
          opts.settings = {
            tailwindCSS = {
              includeLanguages = {
                javascript = "javascript",
                typescript = "typescript", 
                "javascriptreact", "typescriptreact",
                svelte = "html",
                vue = "vue",
                astro = "astro",
                php = "html", -- For Laravel blade files (as a workaround)
              },
            }
          }
        elseif server_name == "volar" then
          opts.root_dir = lspconfig.util.root_pattern("package.json", "vue.config.js", ".git")
          opts.filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" }
        end
        
        lspconfig[server_name].setup(opts)
      end,
    }
  })
else
  -- Fallback for older configuration if mason-lspconfig fails
  local lspconfig = require("lspconfig")
  for _, server in ipairs(servers) do
    local opts = {
      on_attach = on_attach_with_keymaps,
      capabilities = capabilities,
    }
    
    lspconfig[server].setup(opts)
  end
end
