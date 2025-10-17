-- Konfigurasi sementara untuk menonaktifkan indentasi di NvChad
-- File ini dirancang khusus untuk menangani indentasi tanpa mengubah konfigurasi utama

local M = {}

-- Fungsi untuk menonaktifkan semua bentuk indentasi dengan pendekatan menyeluruh
function M.disable_all_indents()
  -- Nonaktifkan plugin indent-blankline secara efektif
  vim.g.indent_blankline_enabled = 0
  vim.b.indent_blankline_enabled = 0
  
  -- Cek apakah ibl (indent-blankline terbaru) tersedia
  local status_ok, ibl = pcall(require, "ibl")
  if status_ok then
    -- Nonaktifkan plugin dengan konfigurasi kosong
    ibl.setup({
      enabled = false,
      exclude = {
        buftypes = {},
        filetypes = {}
      }
    })
  end
  
  -- Hapus semua highlight indentasi
  local highlight_commands = {
    "highlight IndentBlanklineChar guifg=NONE guibg=NONE gui=NONE",
    "highlight IndentBlanklineContextChar guifg=NONE guibg=NONE gui=NONE",
    "highlight IndentBlanklineSpaceChar guifg=NONE guibg=NONE gui=NONE",
    "highlight IndentBlanklineSpaceCharBlankline guifg=NONE guibg=NONE gui=NONE",
    "highlight IndentBlanklineContextStart guifg=NONE guibg=NONE gui=NONE",
    "highlight IndentBlanklineContextEnd guifg=NONE guibg=NONE gui=NONE"
  }
  
  for _, cmd in ipairs(highlight_commands) do
    pcall(vim.cmd, cmd)
  end
  
  -- Nonaktifkan tampilan list yang bisa menampilkan karakter indentasi
  vim.opt.list = false
  
  -- Jika Anda menggunakan mini.nvim, nonaktifkan indentscope juga
  local mini_status_ok, mini = pcall(require, "mini.indentscope")
  if mini_status_ok then
    -- Hapus indentscope aktif di buffer ini
    pcall(vim.api.nvim_buf_del_extmark, 0, "MiniIndentscope", vim.api.nvim_buf_get_extmark_by_id(0, "MiniIndentscope", 1, {}))
  end
  
  vim.notify("Semua indentasi telah dinonaktifkan", vim.log.levels.INFO)
end

-- Fungsi untuk mengaktifkan kembali semua indentasi
function M.enable_all_indents()
  -- Aktifkan kembali plugin indent-blankline
  vim.g.indent_blankline_enabled = 1
  vim.b.indent_blankline_enabled = 1
  
  -- Jika ibl tersedia, aktifkan kembali
  local status_ok, ibl = pcall(require, "ibl")
  if status_ok then
    -- Kembalikan setup default dari plugin
    ibl.setup({
      enabled = true,
      indent = { char = "│" },  -- Karakter indentasi default
      scope = { 
        enabled = true,
        char = "│",
        show_start = false,
        show_end = false,
      },
      exclude = {
        buftypes = { "terminal" },
        filetypes = { "help", "packer", "dashboard", "NvimTree", "neo-tree" }
      }
    })
  end
  
  -- Kembalikan highlight ke default
  local reset_commands = {
    "highlight! link IndentBlanklineChar Whitespace",
    "highlight! link IndentBlanklineContextChar NonText"
  }
  
  for _, cmd in ipairs(reset_commands) do
    pcall(vim.cmd, cmd)
  end
  
  -- Aktifkan kembali list
  vim.opt.list = true
  
  vim.notify("Semua indentasi telah diaktifkan kembali", vim.log.levels.INFO)
end

-- Fungsi toggle untuk beralih antara aktif dan non-aktif
function M.toggle_indents()
  if vim.g.indent_blankline_enabled == 0 then
    M.enable_all_indents()
  else
    M.disable_all_indents()
  end
end

return M