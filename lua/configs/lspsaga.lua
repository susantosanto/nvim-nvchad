-- Konfigurasi lspsaga untuk breadcrumbs
local M = {}

M.config = function()
  -- Cek apakah lspsaga tersedia
  local saga_status, saga = pcall(require, 'lspsaga')
  if not saga_status then
    print("Lspsaga tidak ditemukan")
    return
  end

  -- Setup lspsaga
  saga.setup({
    -- Konfigurasi breadcrumbs
    symbol_in_winbar = {
      enable = true,
      separator = "  ",
      show_file = true,
      folder_level = 2,
      auto_preview = true,
      click = true, -- Aktifkan klik untuk navigasi
    },
    
    -- Konfigurasi UI
    ui = {
      border = "rounded",
    },
    
    -- Konfigurasi code action
    code_action = {
      num_shortcut = true,
      show_server_name = false,
      extend_lines = true,
      auto_preview = true,
    },
    
    -- Konfigurasi lightbulb
    lightbulb = {
      enable = true,
      enable_in_insert = true,
      sign = true,
      virtual_text = true,
    },
    
    -- Konfigurasi outline
    outline = {
      win_width = 30,
      show_detail = true,
      auto_preview = true,
      auto_refresh = true,
      auto_close = true,
    },
  })
  
  -- Aktifkan winbar untuk breadcrumbs jika memungkinkan
  local ok, _ = pcall(require, "lspsaga.symbolwinbar")
  if ok then
    vim.o.winbar = "%{%v:lua.require'lspsaga.symbolwinbar'.get_winbar()%}"
  end
end

return M