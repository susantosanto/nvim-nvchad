-- Cara langsung untuk menonaktifkan indentasi di NvChad
-- Copas perintah ini ke command line Neovim (tekan : lalu paste)

-- Untuk menonaktifkan semua indentasi
vim.g.indent_blankline_enabled = 0
vim.b.indent_blankline_enabled = 0
vim.opt.list = false

-- Hapus highlight indentasi jika ada
pcall(vim.cmd, "highlight IndentBlanklineChar guifg=NONE guibg=NONE gui=NONE")
pcall(vim.cmd, "highlight IndentBlanklineContextChar guifg=NONE guibg=NONE gui=NONE")
pcall(vim.cmd, "highlight IndentBlanklineSpaceChar guifg=NONE guibg=NONE gui=NONE")
pcall(vim.cmd, "highlight IndentBlanklineSpaceCharBlankline guifg=NONE guibg=NONE gui=NONE")

-- Jika plugin ibl (indent-blankline terbaru) tersedia, nonaktifkan
local status_ok, ibl = pcall(require, "ibl")
if status_ok then
  ibl.setup({ enabled = false })
end

print("Indentasi berhasil dinonaktifkan")