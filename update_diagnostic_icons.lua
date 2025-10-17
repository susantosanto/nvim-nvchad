-- Konfigurasi untuk mengganti huruf E dan W dengan ikon yang lebih modern dan profesional
-- Berdasarkan analisis konfigurasi Anda, ini menyesuaikan dengan tiny-inline-diagnostic.nvim dan konfigurasi LSP

-- Konfigurasi utama diagnostic
local signs_config = {
  text = {
    [vim.diagnostic.severity.ERROR] = " ", -- nf-fa-times_circle (lebih profesional)
    [vim.diagnostic.severity.WARN] = " ",  -- nf-fa-warning (lebih profesional)
    [vim.diagnostic.severity.HINT] = "󰌶 ",   -- nf-md-auto_fix 
    [vim.diagnostic.severity.INFO] = " "   -- nf-fa-info_circle
  },
  numhl = false,
  texthl = false,
}

-- Terapkan konfigurasi diagnostic
vim.diagnostic.config({
  virtual_text = {
    prefix = "", -- Hilangkan prefix default
    format = function(diagnostic)
      -- Gunakan ikon yang lebih profesional sesuai tingkat keparahan
      if diagnostic.severity == vim.diagnostic.severity.ERROR then
        return " " .. diagnostic.message
      elseif diagnostic.severity == vim.diagnostic.severity.WARN then
        return " " .. diagnostic.message
      elseif diagnostic.severity == vim.diagnostic.severity.HINT then
        return "󰌶 " .. diagnostic.message
      elseif diagnostic.severity == vim.diagnostic.severity.INFO then
        return " " .. diagnostic.message
      end
    end
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
      [vim.diagnostic.severity.INFO] = " "
    }
  },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
})

-- Jika tiny-inline-diagnostic digunakan, kita juga perlu mengonfigurasi ulang
local ok, tiny_inline_diag = pcall(require, "tiny-inline-diagnostic")
if ok then
  -- Atur kembali dengan ikon yang lebih modern
  tiny_inline_diag.setup({
    align = "right", -- atau "left" tergantung preferensi
    icons = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
      [vim.diagnostic.severity.INFO] = " "
    },
    max_width = 40, -- Maksimal lebar pesan
    max_height = 2, -- Maksimal tinggi pesan
  })
end

print("Diagnostic icons updated to more modern and professional ones")