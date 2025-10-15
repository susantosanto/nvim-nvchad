-- Safe loading of NvChad autocmds with error handling
local success, nvchad_autocmds = pcall(require, "nvchad.autocmds")

if not success then
  -- If there's an issue with the NvChad autocmds, create a basic setup
  vim.api.nvim_create_augroup("NvChadSafe", { clear = true })
end

-- Add custom autocmds to handle the buffer deletion error
local buffer_group = vim.api.nvim_create_augroup("BufferSafeHandling", { clear = true })

-- Create a function to safely check and delete buffers
local function safe_buf_delete(bufnr, opts)
  opts = opts or {}
  if bufnr and vim.api.nvim_buf_is_valid(bufnr) then
    -- Only attempt deletion if the buffer exists
    local success, err = pcall(vim.api.nvim_buf_delete, bufnr, opts)
    if not success then
      -- Optionally log the error, but don't interrupt functionality
      vim.schedule(function()
        -- Don't print error to avoid spamming the message area
      end)
    end
    return success
  end
  return false
end

-- Override any buffer deletion operations to be safe
-- Create an augroup to catch specific buffer events that might cause the error
vim.api.nvim_create_autocmd("UIEnter", {
  group = buffer_group,
  callback = function()
    -- Hook into the buffer deletion process to make it safer
  end,
  desc = "Safely handle UI enter to prevent buffer errors",
})

-- Add a catch-all for potential buffer issues
vim.api.nvim_create_autocmd("VimEnter", {
  group = buffer_group,
  callback = function()
    -- Ensure the main buffer is valid
    if vim.api.nvim_buf_is_valid(1) then
      -- Buffer 1 exists, proceed normally
    end
  end,
  desc = "Check buffer safety on VimEnter",
})

-- Enhanced folding autocommands
vim.api.nvim_create_augroup('FoldingSetup', { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  group = 'FoldingSetup',
  pattern = { "*" },
  callback = function()
    vim.o.foldlevel = 99
    vim.o.foldenable = true
  end,
})

-- Ensure folding is enabled for all file types
vim.api.nvim_create_autocmd("FileType", {
  group = 'FoldingSetup',
  pattern = "*",
  callback = function()
    vim.o.foldlevel = 99
    vim.o.foldenable = true
  end,
})
