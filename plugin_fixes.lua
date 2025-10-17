-- File perbaikan plugin sementara untuk NvChad
-- Digunakan untuk memperbaiki error-error plugin tanpa menghapus konfigurasi utama

local M = {}

-- Fungsi untuk membersihkan cache plugin bermasalah
function M.clean_troublesome_plugins()
  -- Tidak melakukan apa-apa, hanya menyediakan informasi
  print("Untuk membersihkan plugin bermasalah:")
  print("1. Buka Neovim dan jalankan ':Lazy'")
  print("2. Tekan 'c' untuk membersihkan plugin yang tidak digunakan")
  print("3. Tekan 'U' untuk mengupdate semua plugin")
  print("4. Tekan 'S' untuk sync semua plugin")
  
  -- Khusus untuk cmp-async-path, karena memiliki masalah dengan Codeberg
  print("\\nJika cmp-async-path masih bermasalah:")
  print("Plugin ini mungkin perlu alternatif karena error 502 dari Codeberg")
  print("Coba buka file konfigurasi plugins Anda dan ubah URL jika diperlukan")
  
  -- Khusus untuk LuaSnip
  print("\\nJika LuaSnip masih menunjukkan perubahan lokal:")
  print("Ini biasanya karena submodule deps/jsregexp")
  print("Kita sudah membersihkan perubahan ini sebelumnya")
end

-- Fungsi untuk mengecek status plugin
function M.check_plugins_status()
  print("Untuk mengecek status plugin saat ini:")
  print("1. Buka Neovim")
  print("2. Jalankan ':Lazy'")
  print("3. Lihat status plugin di sana")
  print("4. Plugin yang bermasalah akan ditandai")
end

return M