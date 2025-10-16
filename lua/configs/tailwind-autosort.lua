-- Tailwind CSS auto sort configuration
local M = {}

M.setup = function()
  -- Setup tailwind-autosort
  require("tailwind-autosort").setup({
    -- Enable autocommand to automatically sort on save
    enable_autocmd = true,
    notify_line_changed = true,
  })
  
  -- Create a custom command to manually sort Tailwind classes
  vim.api.nvim_create_user_command("TWSort", function()
    -- For manual sort, we can trigger a write command
    vim.cmd("silent write")
  end, { desc = "Sort Tailwind CSS classes in current buffer" })
end

return M