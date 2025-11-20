-- Konfigurasi lab.nvim untuk setup manual
local M = {}

function M.setup_lab()
  local success, lab = pcall(require, "lab")
  if success then
    lab.setup({
      code_runner = {
        enabled = true,
      },
      quick_data = {
        enabled = true,
      },
    })
    vim.notify("Lab.nvim setup completed", vim.log.levels.INFO)
  else
    vim.notify("Failed to load lab.nvim", vim.log.levels.ERROR)
  end
end

-- Setup hanya jika plugin sudah dimuat
if package.loaded["lab"] then
  M.setup_lab()
else
  -- Tunggu plugin dimuat, lalu setup
  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyLoad",
    callback = function()
      vim.defer_fn(M.setup_lab, 100)
    end,
  })
end

return M