-- Load NvChad defaults
local nvchad_lsp = require("nvchad.configs.lspconfig")
local on_attach = nvchad_lsp.on_attach
local capabilities = nvchad_lsp.capabilities

-- Additional on_attach function optimized for performance
local on_attach_with_keymaps = function(client, bufnr)
  -- Apply basic on_attach from NvChad
  on_attach(client, bufnr)

  -- Optimize client capabilities to reduce load
  client.server_capabilities.hoverProvider = false  -- Disable hover to prevent performance hit
  client.server_capabilities.signatureHelpProvider = false  -- Disable signature help
  client.server_capabilities.documentFormattingProvider = false  -- Use conform.nvim instead
  client.server_capabilities.documentRangeFormattingProvider = false  -- Use conform.nvim instead

  -- Add only essential keymaps
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Define only essential servers for web development
local servers = {
  "html",
  "cssls", 
  "jsonls",
  "lua_ls", -- For Neovim config
  "ts_ls", -- TypeScript/JavaScript (most important for React)
}

-- Configure mason-lspconfig with performance optimizations
local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if mason_lspconfig_ok then
  mason_lspconfig.setup({
    ensure_installed = servers,
    handlers = {
      -- Default handler with performance optimizations
      function(server_name)
        local lspconfig = require("lspconfig")
        local opts = {
          on_attach = on_attach_with_keymaps,
          capabilities = capabilities,
          -- Optimize update frequency to reduce load
          flags = {
            debounce_text_changes = 150, -- Reduce frequency of LSP updates
          },
        }

        if server_name == "ts_ls" then
          -- Optimize ts_ls specifically for React projects
          opts.root_dir = require("lspconfig").util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
          opts.init_options = {
            hostInfo = "neovim",
            maxTsServerMemory = 2048, -- Limit memory usage for large projects
          }
          opts.settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "none", -- Disable inlay hints to improve performance
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = false,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = false,
                includeInlayFunctionLikeReturnTypeHints = false,
                includeInlayEnumMemberValueHints = false,
              },
              -- Optimize performance in large projects
              preferences = {
                includePackageJsonAutoImports = "auto",
                -- Exclude node_modules from type checking
                excludeLibrarySymbolsInNavToReferences = true,
                excludeLibrarySymbolsInNavToAnywhere = true,
              }
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "none", -- Disable inlay hints to improve performance
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = false,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = false,
                includeInlayFunctionLikeReturnTypeHints = false,
                includeInlayEnumMemberValueHints = false,
              },
              -- Optimize performance in large projects
              preferences = {
                includePackageJsonAutoImports = "auto",
                -- Exclude node_modules from type checking
                excludeLibrarySymbolsInNavToReferences = true,
                excludeLibrarySymbolsInNavToAnywhere = true,
              }
            },
          }
        elseif server_name == "html" then
          opts.filetypes = { "html", "javascript", "typescript" }
        elseif server_name == "cssls" then
          opts.settings = {
            css = {
              validate = false, -- Disable validation to improve performance
            },
            scss = {
              validate = false, -- Disable validation to improve performance
            }
          }
        end

        lspconfig[server_name].setup(opts)
      end,
    },
  })
end
