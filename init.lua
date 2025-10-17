vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

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
      [vim.diagnostic.severity.INFO] = " "
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

require "options"
require "autocmds"

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
            [vim.diagnostic.severity.INFO] = " "
          },
          numhl = false, -- Don't highlight the line number, just the sign column
        },
        update_in_insert = false,
        underline = true,
        severity_sort = true,
      })
    end)
  end,
  desc = "Reapply diagnostic configuration after startup"
})

vim.schedule(function()
  require "mappings"
end)
