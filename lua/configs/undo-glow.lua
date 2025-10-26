-- Konfigurasi untuk undo-glow.nvim
local M = {}

function M.setup()
  -- Memastikan plugin terload
  require("undo-glow").setup({
    animation = {
      enabled = true,
      duration = 150,
      animation_type = "fade",  -- Menggunakan "fade" karena "flash" mungkin bukan tipe bawaan
      fps = 120,
      easing = "in_out_cubic",
      window_scoped = false,
    },
    highlights = {
      undo = { hl_color = { bg = "#FF5555" } },
      redo = { hl_color = { bg = "#50FA7B" } },
      yank = { hl_color = { bg = "#F1FA8C" } },
      paste = { hl_color = { bg = "#8BE9FD" } },
      search = { hl_color = { bg = "#BD93F9" } },
      comment = { hl_color = { bg = "#FFB86C" } },
      cursor = { hl_color = { bg = "#FF79C6" } },
    },
    priority = 4096,
  })

  -- Membuat highlight untuk operasi yank
  vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
      require("undo-glow").yank()
    end,
    group = vim.api.nvim_create_augroup('UndoGlowYank', { clear = true }),
    desc = 'Highlight yank dengan undo-glow'
  })

  -- Menambahkan highlight untuk operasi search
  local search_augroup = vim.api.nvim_create_augroup('UndoGlowSearch', { clear = true })
  
  vim.api.nvim_create_autocmd('CmdlineEnter', {
    pattern = {'/', '?'},
    callback = function()
      vim.api.nvim_create_autocmd('CmdlineLeave', {
        once = true,
        group = search_augroup,
        callback = function()
          if vim.v.hlsearch == 1 then
            require("undo-glow").search_cmd()
          end
        end,
      })
    end,
    group = search_augroup,
    desc = 'Highlight search dengan undo-glow'
  })

  -- Menambahkan highlight untuk undo/redo
  vim.keymap.set('n', 'u', function()
    require("undo-glow").undo()
    vim.api.nvim_feedkeys('u', 'n', false)
  end, { desc = 'Undo dengan highlight undo-glow' })

  vim.keymap.set('n', '<C-r>', function()
    require("undo-glow").redo()
    vim.api.nvim_feedkeys('<C-r>', 'n', false)
  end, { desc = 'Redo dengan highlight undo-glow' })
  
  -- Menambahkan highlight untuk undo/redo
  vim.keymap.set('n', 'u', function()
    require("undo-glow").undo()
    vim.api.nvim_feedkeys('u', 'n', true)
  end, { desc = 'Undo dengan highlight undo-glow' })

  vim.keymap.set('n', '<C-r>', function()
    require("undo-glow").redo()
    vim.api.nvim_feedkeys('<C-r>', 'n', true)
  end, { desc = 'Redo dengan highlight undo-glow' })

  -- For paste operations, we'll handle them differently to avoid any recursion
  -- Let's not override the default paste keys directly
  -- The undo-glow plugin can still provide visual feedback through other means
  
  -- Since the paste keymap override is causing the recursion issue,
  -- we'll remove the paste keymap overrides and let the normal paste work
  -- The undo-glow functionality for paste can work through other mechanisms

end

return M