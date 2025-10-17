-- Alternatif: Perintah langsung untuk menonaktifkan indentasi
-- Anda bisa menyalin dan menempelkan perintah ini langsung ke command mode Neovim (:)

-- Perintah untuk menonaktifkan indent blankline saat ini:
-- :let g:indent_blankline_enabled=0 | set nolist | hi IndentBlanklineContextChar guifg=#505050 gui=reverse | hi IndentBlanklineChar guifg=#202020 gui=reverse

-- Perintah untuk mengaktifkan kembali indent blankline:
-- :let g:indent_blankline_enabled=1 | set list | hi clear IndentBlanklineContextChar | hi clear IndentBlanklineChar

-- Perintah untuk menonaktifkan semua highlight indentasi (cara paling efektif):
-- :echo "Disabling indent lines..." | let g:indent_blankline_enabled=0 | let b:indent_blankline_enabled=0 | hi clear IndentBlanklineChar | hi clear IndentBlanklineContextChar | hi clear IndentBlanklineSpaceChar | hi clear IndentBlanklineSpaceCharBlankline | hi clear IndentBlanklineContextStart | hi clear IndentBlanklineContext

-- Perintah untuk mengaktifkan kembali semua highlight indentasi:
-- :echo "Enabling indent lines..." | let g:indent_blankline_enabled=1 | let b:indent_blankline_enabled=1 | let g:indent_blankline_filetype_exclude = [] | let g:indent_blankline_buftype_exclude = []

-- Anda juga bisa menggunakan perintah ini untuk toggle antara aktif dan nonaktif:
-- Untuk toggle, gunakan script ini:
function! ToggleIndentLines()
  if exists('g:indent_blankline_enabled') && g:indent_blankline_enabled == 0
    " Jika saat ini nonaktif, aktifkan kembali
    let g:indent_blankline_enabled = 1
    let b:indent_blankline_enabled = 1
    echo "Indent lines enabled"
  else
    " Jika saat ini aktif, nonaktifkan
    let g:indent_blankline_enabled = 0
    let b:indent_blankline_enabled = 0
    echo "Indent lines disabled"
  endif
endfunction

-- Gunakan perintah ini untuk men-toggle: :call ToggleIndentLines()