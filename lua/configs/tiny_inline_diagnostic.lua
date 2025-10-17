-- Konfigurasi tiny-inline-diagnostic.nvim untuk menggunakan ikon modern dan profesional

local M = {}

function M.setup()
  local ok, tiny_inline_diag = pcall(require, "tiny-inline-diagnostic")
  if ok then
    -- Konfigurasi dengan ikon yang lebih modern dan profesional
    tiny_inline_diag.setup({
      align = "right", -- atau "left" tergantung preferensi
      icons = {
        [vim.diagnostic.severity.ERROR] = " ", -- nf-fa-times_circle
        [vim.diagnostic.severity.WARN] = " ",  -- nf-fa-warning
        [vim.diagnostic.severity.HINT] = "󰌶 ",   -- nf-md-auto_fix
        [vim.diagnostic.severity.INFO] = " "   -- nf-fa-info_circle
      },
      max_width = 40, -- Maksimal lebar pesan
      max_height = 2, -- Maksimal tinggi pesan
    })
  end
end

return M