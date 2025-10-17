-- File sementara untuk menonaktifkan garis indentasi tanpa mengubah konfigurasi utama
-- Gunakan perintah ini di Neovim untuk menonaktifkan garis indentasi
-- :lua require('disable_indent_lines').disable()

local M = {}

function M.disable()
  -- Nonaktifkan indent-blankline jika plugin telah dimuat
  if pcall(require, "ibl") then -- untuk indent-blankline versi terbaru
    -- Nonaktifkan highlight karakter indentasi
    vim.b.indent_blankline_enabled = 0
    vim.g.indent_blankline_enabled = 0
    
    -- Nonaktifkan semua highlight indentasi
    vim.cmd [[highlight! IndentBlanklineChar guifg=NONE gui=NONE]]
    vim.cmd [[highlight! IndentBlanklineContextChar guifg=NONE gui=NONE]]
    vim.cmd [[highlight! IndentBlanklineSpaceChar guifg=NONE gui=NONE]]
    vim.cmd [[highlight! IndentBlanklineSpaceCharBlankline guifg=NONE gui=NONE]]
    
    -- Update plugin
    require("ibl").update { enabled = false }
    
    vim.notify("Indent blankline lines disabled", vim.log.levels.INFO)
  elseif pcall(require, "indent_blankline") then -- untuk indent-blankline versi lama
    vim.g.indent_blankline_enabled = 0
    vim.b.indent_blankline_enabled = 0
    vim.notify("Indent blankline lines disabled", vim.log.levels.INFO)
  else
    -- Jika tidak menemukan plugin indent-blankline, coba set variabel global yang umum
    vim.g.indent_blankline_enabled = 0
    vim.b.indent_blankline_enabled = 0
    vim.g.indentLine_enabled = 0
    vim.notify("Attempted to disable indent lines", vim.log.levels.INFO)
  end
end

function M.enable()
  -- Aktifkan kembali indent-blankline
  if pcall(require, "ibl") then -- untuk indent-blankline versi terbaru
    vim.b.indent_blankline_enabled = 1
    vim.g.indent_blankline_enabled = 1
    
    -- Kembalikan highlight indentasi ke default
    vim.cmd [[highlight! link IndentBlanklineChar Whitespace]]
    vim.cmd [[highlight! link IndentBlanklineContextChar NonText]]
    
    -- Update plugin
    require("ibl").update { enabled = true }
    
    vim.notify("Indent blankline lines enabled", vim.log.levels.INFO)
  elseif pcall(require, "indent_blankline") then -- untuk indent-blankline versi lama
    vim.g.indent_blankline_enabled = 1
    vim.b.indent_blankline_enabled = 1
    vim.notify("Indent blankline lines enabled", vim.log.levels.INFO)
  else
    vim.g.indent_blankline_enabled = 1
    vim.b.indent_blankline_enabled = 1
    vim.g.indentLine_enabled = 1
    vim.notify("Attempted to enable indent lines", vim.log.levels.INFO)
  end
end

function M.toggle()
  -- Toggle (aktif/nonaktif) indentasi
  if pcall(require, "ibl") then
    local enabled = vim.g.indent_blankline_enabled ~= 0 and vim.b.indent_blankline_enabled ~= 0
    if enabled then
      M.disable()
    else
      M.enable()
    end
  else
    local is_enabled = vim.g.indent_blankline_enabled ~= 0 or vim.b.indent_blankline_enabled ~= 0
    if is_enabled then
      M.disable()
    else
      M.enable()
    end
  end
end

return M