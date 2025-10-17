-- Cara langsung untuk mengaktifkan kembali indentasi di NvChad
-- Copas perintah ini ke command line Neovim (tekan : lalu paste)

-- Untuk mengaktifkan kembali indentasi
vim.g.indent_blankline_enabled = 1
vim.b.indent_blankline_enabled = 1
vim.opt.list = true

-- Kembalikan highlight indentasi
pcall(vim.cmd, "highlight! link IndentBlanklineChar Whitespace")
pcall(vim.cmd, "highlight! link IndentBlanklineContextChar NonText")

-- Jika plugin ibl (indent-blankline terbaru) tersedia, aktifkan kembali
local status_ok, ibl = pcall(require, "ibl")
if status_ok then
  ibl.setup({ enabled = true })
end

print("Indentasi berhasil diaktifkan kembali")