vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

-- Override nvim_buf_delete to handle buffer errors
local original_buf_delete = vim.api.nvim_buf_delete
vim.api.nvim_buf_delete = function(bufnr, opts)
  -- Only attempt to delete if the buffer exists and is valid
  if bufnr and vim.api.nvim_buf_is_valid(bufnr) then
    local success, result = pcall(original_buf_delete, bufnr, opts or {})
    if not success then
      -- If deletion fails, silently ignore (this handles the NvChad buffer error)
      return
    end
    return result
  end
end

-- Also override nvim_buf_line_count to handle the Floaterm buffer error (Invalid buffer id: 22)
local original_buf_line_count = vim.api.nvim_buf_line_count
vim.api.nvim_buf_line_count = function(bufnr)
  -- Only attempt to get line count if the buffer exists and is valid
  if bufnr and vim.api.nvim_buf_is_valid(bufnr) then
    local success, result = pcall(original_buf_line_count, bufnr)
    if success then
      return result
    else
      -- If operation fails, return a safe default
      return 1
    end
  else
    -- If buffer is invalid, return a safe default
    return 1
  end
end

-- Configure diagnostic with professional icons for signs only (let tiny-inline-diagnostic handle virtual text)
vim.diagnostic.config({
  virtual_text = false, -- Disable default virtual text, let tiny-inline-diagnostic handle it
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
      [vim.diagnostic.severity.INFO] = " ",
    },
    numhl = false, -- Don't highlight the line number, just the sign column
  },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
})

-- Auto-format on save with safe Lua handling
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.php", "*.css", "*.scss", "*.html", "*.json", "*.yaml", "*.lua" },
  callback = function()
    local conform = require("conform")
    -- Handle Lua files with special care to prevent syntax scrambling
    if vim.bo.filetype == "lua" then
      local ok, _ = pcall(function()
        conform.format({
          timeout_ms = 1000,
          lsp_fallback = true,
        })
      end)
      -- If formatting fails, silently continue without error
      if not ok then
        vim.notify("Lua formatting failed, file saved without formatting", vim.log.levels.WARN)
      end
    else
      -- Format non-Lua files normally
      conform.format({
        timeout_ms = 1000,
        lsp_fallback = true,
      })
    end
  end,
})

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("options")
require("autocmds")

-- Apply diagnostic configuration again after all plugins are loaded
-- This ensures it overrides any default configuration from NvChad or other plugins
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.schedule(function()
      -- Reapply our diagnostic configuration to ensure it takes effect
      vim.diagnostic.config({
        virtual_text = false, -- Disable default virtual text, let tiny-inline-diagnostic handle it
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
            [vim.diagnostic.severity.INFO] = " ",
          },
          numhl = false, -- Don't highlight the line number, just the sign column
        },
        update_in_insert = false,
        underline = true,
        severity_sort = true,
      })
    end)
  end,
  desc = "Reapply diagnostic configuration after startup",
})

-- Load mappings
vim.schedule(function()
  require("mappings")
end)


-- Ensure todo-comments is initialized with correct configuration early
if pcall(require, "todo-comments") then
  -- Apply our todo-comments configuration to make sure it's properly initialized
  require("todo-comments").setup({
    signs = true,
    sign_priority = 8,
    keywords = {
      FIX = {
        icon = "󰁍 ",
        color = "error",
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
      },
      TODO = { icon = "󰌶 ", color = "info" },
      HACK = { icon = "󰊙 ", color = "warning" },
      WARN = { icon = "󰌱 ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = "󰓅 ", alt = { "OPTIM", "PERFORMANCE", "BENCH", "BENCHMARK" } },
      NOTE = { icon = "󰋽 ", color = "hint", alt = { "INFO" } },
      BUG = { icon = "󰨰 ", color = "error" },
    },
    gui_style = {
      fg = "BOLD",
      bg = "italic",
    },
    merge_keywords = true,
    highlight = {
      multiline = true,
      multiline_pattern = "^.",
      multiline_context = 10,
      before = "fg",
      keyword = "wide",
      after = "fg",
      pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
      comments_only = true,
      max_line_len = 400,
      exclude = {},
    },
    colors = {
      error = { "DiagnosticError", "ErrorMsg", "#C72E0F" }, -- Merah yang lebih gelap untuk kontras lebih baik
      warning = { "DiagnosticWarn", "WarningMsg", "#D9A20F" }, -- Oranye yang lebih kontras
      info = { "DiagnosticInfo", "#1E66F5" }, -- Biru yang lebih gelap, lebih kontras
      hint = { "DiagnosticHint", "#0F9D58" }, -- Hijau yang lebih kontras
      default = { "Identifier", "#9B59B6" },
      test = { "Identifier", "#8E44AD" },
    },
    search = {
      command = "TodoTelescope",
      args = {
        pattern = [[\b\w*TODO\b]],
      },
    },
  })
end

-- Setup dashboard-nvim highlight groups
vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#7aa2f7', bold = true })
vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#a9b1d6', italic = true })
vim.api.nvim_set_hl(0, 'DashboardCenterIcon', { fg = '#bb9af7' })
vim.api.nvim_set_hl(0, 'DashboardCenterText', { fg = '#a9b1d6' })
vim.api.nvim_set_hl(0, 'DashboardCenterKey', { fg = '#7dcfff', bold = true })

vim.opt.signcolumn = "yes"

-- Disable all automatic hover and signature help globally to prevent mode switching
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      -- Disable hover and signature help providers to prevent automatic popups
      client.server_capabilities.hoverProvider = false
      client.server_capabilities.signatureHelpProvider = false
    end
  end,
})

-- Disable built-in LSP hover functionality entirely
vim.lsp.handlers["textDocument/hover"] = function() end
vim.lsp.handlers["textDocument/signatureHelp"] = function() end

-- Disable lspsaga winbar since we're using dropbar.nvim for breadcrumbs
vim.o.winbar = ""

-- Initialize undotree and create commands manually
local undotree_ok, undotree = pcall(require, "undotree")
if undotree_ok then
  undotree.setup({})

  -- Define the commands manually since the plugin doesn't do it automatically
  vim.api.nvim_create_user_command("UndotreeToggle", function()
    require("undotree").toggle()
  end, { desc = "Toggle undotree" })

  vim.api.nvim_create_user_command("UndotreeShow", function()
    require("undotree").open()
  end, { desc = "Show undotree" })

  vim.api.nvim_create_user_command("UndotreeHide", function()
    require("undotree").close()
  end, { desc = "Hide undotree" })

  vim.api.nvim_create_user_command("UndotreeFocus", function()
    -- Focus undotree implementation would go here if needed
  end, { desc = "Focus undotree" })
end



