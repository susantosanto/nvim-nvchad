-- File untuk men-disable indentasi dengan pendekatan paling komprehensif
-- Gunakan perintah ini di Neovim: :lua require('disable_all_indent').disable_all()

local M = {}

-- Fungsi untuk menonaktifkan semua bentuk indentasi
function M.disable_all()
  -- Set variabel global dan buffer
  vim.g.indent_blankline_enabled = 0
  vim.b.indent_blankline_enabled = 0
  
  -- Jika ibl (indent-blankline terbaru) tersedia
  local success, ibl = pcall(require, "ibl")
  if success then
    -- Nonaktifkan semua komponen dari indent-blankline
    ibl.setup {
      enabled = false,
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help", "startify", "dashboard", "packer", "neogitstatus", "NvimTree",
          "terminal", "TelescopePrompt", "TelescopeResults"
        }
      }
    }
    vim.notify("IBL (indent-blankline) disabled completely", vim.log.levels.INFO)
  end
  
  -- Nonaktifkan highlight karakter indentasi
  vim.cmd [[highlight IndentBlanklineChar guifg=NONE gui=NONE guibg=NONE]]
  vim.cmd [[highlight IndentBlanklineContextChar guifg=NONE gui=NONE guibg=NONE]]
  vim.cmd [[highlight IndentBlanklineSpaceChar guifg=NONE gui=NONE guibg=NONE]]
  vim.cmd [[highlight IndentBlanklineSpaceCharBlankline guifg=NONE gui=NONE guibg=NONE]]
  vim.cmd [[highlight IndentBlanklineContextStart guifg=NONE gui=NONE guibg=NONE]]
  
  -- Set listchars untuk menghilangkan indikator indentasi
  local listchars = vim.opt.listchars:get()
  listchars = vim.tbl_filter(function(item)
    return item[1] ~= 'space' and item[1] ~= 'tab' and item[1] ~= 'lead' and item[1] ~= 'trail'
  end, listchars)
  vim.opt.listchars = listchars
  
  -- Matikan list mode sementara untuk menyembunyikan indentasi
  vim.opt.list = false
  
  vim.notify("All indent guides and characters have been disabled", vim.log.levels.INFO)
end

-- Fungsi untuk mengaktifkan kembali semua bentuk indentasi
function M.enable_all()
  -- Set variabel global dan buffer
  vim.g.indent_blankline_enabled = 1
  vim.b.indent_blankline_enabled = 1
  
  -- Jika ibl (indent-blankline terbaru) tersedia
  local success, ibl = pcall(require, "ibl")
  if success then
    -- Gunakan setup default atau setup sebelumnya
    ibl.setup {
      enabled = true,
      scope = { enabled = true },
      exclude = {
        filetypes = {
          "help", "startify", "dashboard", "packer", "neogitstatus", "NvimTree",
          "terminal", "TelescopePrompt", "TelescopeResults"
        }
      }
    }
    vim.notify("IBL (indent-blankline) enabled", vim.log.levels.INFO)
  end
  
  -- Kembalikan highlight karakter indentasi ke default
  vim.cmd [[highlight! link IndentBlanklineChar Whitespace]]
  vim.cmd [[highlight! link IndentBlanklineContextChar NonText]]
  
  -- Kembalikan listchars ke default
  vim.opt.list = true
  
  vim.notify("All indent guides have been enabled", vim.log.levels.INFO)
end

-- Fungsi toggle antara aktif dan nonaktif
function M.toggle_all()
  -- Periksa apakah variabel global menunjukkan status enable/disable
  if vim.g.indent_blankline_enabled == 0 then
    M.enable_all()
  else
    M.disable_all()
  end
end

return M