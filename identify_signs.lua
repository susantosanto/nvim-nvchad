-- Script untuk mengidentifikasi dari mana tanda-tanda E dan W berasal
-- Jalankan ini di Neovim untuk melihat informasi sign yang aktif

local M = {}

function M.identify_signs()
  print("=== Informasi Sign Active ===")
  
  -- Ambil semua buffer saat ini
  local buffers = vim.api.nvim_list_bufs()
  
  for _, bufnr in ipairs(buffers) do
    if vim.api.nvim_buf_is_loaded(bufnr) then
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      if bufname ~= "" then -- Hanya tampilkan buffer dengan nama file
        print("\\nBuffer: " .. bufname)
        
        -- Ambil semua sign di buffer ini
        local signs = vim.fn.sign_getplaced(bufnr, {group='*'})
        for _, group in ipairs(signs) do
          if #group.signs > 0 then
            print("  Group: " .. (group.group or "default"))
            for _, sign in ipairs(group.signs) do
              local sign_name = vim.fn.sign_getdefined(sign.name)[1]
              print("    Line " .. sign.lnum .. ": " .. sign.name .. 
                    " (Defined as: " .. (sign_name and sign_name.text or "unknown") .. ")")
            end
          end
        end
      end
    end
  end
  
  -- Juga tampilkan konfigurasi diagnostic saat ini
  print("\\n=== Konfigurasi Diagnostic Saat Ini ===")
  local config = vim.diagnostic.get_config()
  print("Virtual text enabled: " .. tostring(config.virtual_text ~= false))
  print("Signs enabled: " .. tostring(config.signs ~= false))
  
  if config.signs and config.signs.text then
    print("Current sign text:")
    print("  ERROR: " .. (config.signs.text[vim.diagnostic.severity.ERROR] or "not set"))
    print("  WARN: " .. (config.signs.text[vim.diagnostic.severity.WARN] or "not set"))
    print("  INFO: " .. (config.signs.text[vim.diagnostic.severity.INFO] or "not set"))
    print("  HINT: " .. (config.signs.text[vim.diagnostic.severity.HINT] or "not set"))
  end
end

return M