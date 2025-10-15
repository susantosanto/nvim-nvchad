-- Configuration for nvim-ufo
local M = {}

function M.setup()
  -- Enable ufo provider for folding
  vim.o.foldcolumn = '1' -- '0' is not bad
  vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true

  -- Using ufo provider instead of native lsp
  require('ufo').setup({
    open_fold_hl_timeout = 150,
    close_fold_hl_timeout = 150,
    provider_selector = function(bufnr, filetype, buftype)
      -- Use treesitter if available, otherwise fallback to indent
      return { 'treesitter', 'indent' }
    end,
    preview = {
      win_config = {
        border = { '', '─', '', '', '', '─', '', '' },
        winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
        winblend = 0
      },
      mappings = {
        close = 'q',
        switch = 's',
        trace = 'r'
      }
    }
  })

  -- Create commands for enabling/disabling ufo
  vim.api.nvim_create_user_command('UfoEnable', function()
    vim.o.foldenable = true
    vim.notify('UFO folding enabled', vim.log.levels.INFO)
  end, {})

  vim.api.nvim_create_user_command('UfoDisable', function()
    vim.o.foldenable = false
    vim.notify('UFO folding disabled', vim.log.levels.INFO)
  end, {})

  -- Keymaps for fold handling
  vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'Open all folds' })
  vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close all folds' })
  vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds, { desc = 'Open folds except kinds' })
  vim.keymap.set('n', 'zc', require('ufo').closeFoldsWith, { desc = 'Close folds with' })
  vim.keymap.set('n', 'zk', 'zv', { desc = 'Update view to show cursor line' })
  vim.keymap.set('n', 'zi', require('ufo').detach, { desc = 'Toggle fold integration' })
end

return M