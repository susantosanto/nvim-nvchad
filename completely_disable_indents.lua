-- Script komprehensif untuk menghilangkan semua bentuk indentasi di NvChad
-- File ini mencakup semua kemungkinan sumber garis indentasi

local M = {}

function M.completely_disable_indents()
  -- 1. Nonaktifkan indent-blankline plugin (versi lama dan baru)
  vim.g.indent_blankline_enabled = 0
  vim.b.indent_blankline_enabled = 0
  
  -- 2. Jika plugin ibl (indent-blankline versi baru) tersedia, nonaktifkan
  local ibl_ok, ibl = pcall(require, "ibl")
  if ibl_ok then
    ibl.setup({
      enabled = false,
      indent = { enabled = false },
      scope = { enabled = false },
      whitespace = { enabled = false },
      exclude = {
        buftypes = {},
        filetypes = {}
      }
    })
  end
  
  -- 3. Nonaktifkan juga mini.indentscope jika digunakan
  local mini_ok, mini_indentscope = pcall(require, "mini.indentscope")
  if mini_ok then
    -- Hentikan ekstensi di buffer ini
    vim.b.miniindentscope_disable = true
  end
  
  -- 4. Hapus semua highlight yang terkait dengan indentasi
  local highlight_commands = {
    "highlight clear IndentBlanklineChar",
    "highlight clear IndentBlanklineContextChar",
    "highlight clear IndentBlanklineSpaceChar",
    "highlight clear IndentBlanklineSpaceCharBlankline",
    "highlight clear IndentBlanklineContextStart",
    "highlight clear IndentBlanklineContextEnd",
    "highlight link IndentBlanklineChar NONE",
    "highlight link IndentBlanklineContextChar NONE",
  }
  
  for _, cmd in ipairs(highlight_commands) do
    pcall(vim.cmd, cmd)
  end
  
  -- 5. Nonaktifkan opsi list yang menampilkan karakter indentasi
  vim.opt.list = false
  vim.opt.listchars = { }
  
  -- 6. Reset indentasi display
  vim.opt.showbreak = ""
  
  -- 7. Jika menggunakan fillchars untuk indentasi, reset juga
  local fillchars = vim.opt.fillchars:get()
  local new_fillchars = {}
  for k, v in pairs(fillchars) do
    if k ~= "vert" and k ~= "fold" then
      new_fillchars[k] = v
    end
  end
  vim.opt.fillchars = new_fillchars
  
  vim.notify("Semua indentasi telah dinonaktifkan secara menyeluruh", vim.log.levels.INFO)
end

function M.enable_indents()
  -- 1. Aktifkan kembali indent-blankline
  vim.g.indent_blankline_enabled = 1
  vim.b.indent_blankline_enabled = 1
  
  -- 2. Jika plugin ibl tersedia, aktifkan kembali
  local ibl_ok, ibl = pcall(require, "ibl")
  if ibl_ok then
    ibl.setup({
      enabled = true,
      indent = { char = "│" },
      scope = { 
        enabled = true,
        char = "│",
        show_start = false,
        show_end = false,
      },
    })
  end
  
  -- 3. Aktifkan kembali mini.indentscope jika digunakan
  local mini_ok, mini_indentscope = pcall(require, "mini.indentscope")
  if mini_ok then
    vim.b.miniindentscope_disable = false
  end
  
  -- 4. Kembalikan highlight ke default (jika tersedia)
  local reset_commands = {
    "highlight! link IndentBlanklineChar Whitespace",
    "highlight! link IndentBlanklineContextChar NonText",
  }
  
  for _, cmd in ipairs(reset_commands) do
    pcall(vim.cmd, cmd)
  end
  
  -- 5. Aktifkan kembali list
  vim.opt.list = true
  vim.opt.listchars = { eol = '↲', extends = '❯', precedes = '❮', trail = '·' }
  
  vim.notify("Indentasi telah diaktifkan kembali", vim.log.levels.INFO)
end

function M.toggle_indents()
  if vim.g.indent_blankline_enabled == 0 then
    M.enable_indents()
  else
    M.completely_disable_indents()
  end
end

return M