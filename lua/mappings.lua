local map = vim.keymap.set

-- Floaterm keymaps
map("n", "<C-p>", ":FloatermToggle<CR>", { desc = "Toggle Floaterm" })
map({ "n", "t" }, "<C-j>", function()
  require("floaterm.api").cycle_term_bufs "prev"
end, { desc = "Cycle to previous Floaterm" })
map({ "n", "t" }, "<C-k>", function()
  require("floaterm.api").cycle_term_bufs "next"
end, { desc = "Cycle to next Floaterm" })

local opts = { silent = true, desc = "Luxmotion: " }
local prefix = "<leader>m" -- Prefix untuk mini.nvim keymaps

map("n", prefix, "", { desc = "mini.nvim" }) -- Grouping untuk mini.nvim

-- mini.surround: Operasi surround (tambah, ganti, hapus)
map("n", prefix .. "sa", "<cmd>lua require('mini.surround').add('normal')<CR>", { desc = "Add surround" })
map("v", prefix .. "sa", "<cmd>lua require('mini.surround').add('visual')<CR>", { desc = "Add surround (visual)" })
map("n", prefix .. "sd", "<cmd>lua require('mini.surround').delete()<CR>", { desc = "Delete surround" })
map("n", prefix .. "sr", "<cmd>lua require('mini.surround').replace()<CR>", { desc = "Replace surround" })
map("n", prefix .. "sf", "<cmd>lua require('mini.surround').find()<CR>", { desc = "Find surround" })
map("n", "<leader>mc", "<Esc>", { desc = "Cancel mini.surround operation" })
-- mini.files: File explorer
map(
  "n",
  prefix .. "f",
  "<cmd>lua require('mini.files').open(vim.api.nvim_buf_get_name(0), true)<CR>",
  { desc = "Open mini.files (current file dir)" }
)
map(
  "n",
  prefix .. "F",
  "<cmd>lua require('mini.files').open(vim.loop.cwd(), true)<CR>",
  { desc = "Open mini.files (working dir)" }
)


-- mini.trailspace: Hapus trailing whitespace
map("n", prefix .. "tw", "<cmd>lua require('mini.trailspace').trim()<CR>", { desc = "Trim trailing whitespace" })
map(
  "n",
  prefix .. "tl",
  "<cmd>lua require('mini.trailspace').trim_last_lines()<CR>",
  { desc = "Trim empty last lines" }
)

-- mini.git: Perintah Git
map("n", prefix .. "gs", "<cmd>lua require('mini.git').show_at_cursor()<CR>", { desc = "Show Git info at cursor" })
map(
  "n",
  prefix .. "gd",
  "<cmd>lua require('mini.git').show_diff({ source = 'staged' })<CR>",
  { desc = "Show staged diff" }
)

-- mini.animate, mini.pairs, mini.indentscope: Tidak perlu keymap karena otomatis
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("i", "jj", "<ESC>", { desc = "Exit insert mode" })
map("n", "<S-q>", function()
  local bufs = vim.fn.getbufinfo { buflisted = true }
  vim.api.nvim_buf_delete(0, { force = false })
  if #bufs <= 1 then
    vim.cmd "enew"
  end
end, { desc = "Close buffer" })

map("n", "<leader>wc", "<C-w>c", { desc = "Close current window" })
map("n", "<leader><leader>", "<cmd>Telescope find_files<CR>", { desc = "Cari File (Spasi Spasi)" })
map("n", "<leader>cy", ":%y+<CR>", { desc = "Copy whole file to clipboard" })

-- Keymap untuk navigasi antar window
map("n", "<C-J>", "<C-w>j", { desc = "Move to window below" })
map("n", "<C-K>", "<C-w>k", { desc = "Move to window above" })
map("n", "<C-H>", "<C-w>h", { desc = "Move to window left" })
map("n", "<C-L>", "<C-w>l", { desc = "Move to window right" })

-- Keymaps untuk gitsigns
map("n", "<leader>gj", "<cmd>lua require('gitsigns').next_hunk()<CR>", { desc = "Next Git hunk" })
map("n", "<leader>gk", "<cmd>lua require('gitsigns').prev_hunk()<CR>", { desc = "Previous Git hunk" })
map("n", "<leader>gp", "<cmd>lua require('gitsigns').preview_hunk()<CR>", { desc = "Preview Git hunk" })
map("n", "<leader>gr", "<cmd>lua require('gitsigns').reset_hunk()<CR>", { desc = "Reset Git hunk" })
map("n", "<leader>gs", "<cmd>lua require('gitsigns').stage_hunk()<CR>", { desc = "Stage Git hunk" })
map("n", "<leader>gu", "<cmd>lua require('gitsigns').undo_stage_hunk()<CR>", { desc = "Undo stage Git hunk" })

-- Keymaps untuk colorizer
map("n", "<leader>cc", "<cmd>ColorizerToggle<CR>", { desc = "Toggle Colorizer" })

-- Keymaps untuk nvim-ufo (folding) - fallback to native if ufo not loaded
map("n", "zr", function()
  if pcall(require, 'ufo') then
    require('ufo').openFoldsExceptKinds()
  else
    vim.cmd("set foldlevel=99")
  end
end, { desc = "Open all folds" })

map("n", "zm", function()
  if pcall(require, 'ufo') then
    require('ufo').closeFoldsWith()
  else
    vim.cmd("set foldlevel=0")
  end
end, { desc = "Close all folds" })

-- Telescope File Browser keymap
map("n", "<leader>te", function()
  require("telescope").extensions.file_browser.file_browser {
    path = "%:p:h",
    select_buffer = true,
    attach_mappings = function(prompt_bufnr, map)
      map('i', '<C-s>', function()
        local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
        local selection = current_picker:get_selection()
        if selection then
          require("telescope.actions").close(prompt_bufnr)
          vim.cmd("split " .. selection.path)
        end
      end)
      map('i', '<C-v>', function()
        local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
        local selection = current_picker:get_selection()
        if selection then
          require("telescope.actions").close(prompt_bufnr)
          vim.cmd("vsplit " .. selection.path)
        end
      end)
      map('n', 's', function()
        local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
        local selection = current_picker:get_selection()
        if selection then
          require("telescope.actions").close(prompt_bufnr)
          vim.cmd("split " .. selection.path)
        end
      end)
      map('n', 'v', function()
        local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
        local selection = current_picker:get_selection()
        if selection then
          require("telescope.actions").close(prompt_bufnr)
          vim.cmd("vsplit " .. selection.path)
        end
      end)
      return true
    end,
  }
end, { desc = "Open Telescope File Browser" })

-- Nvim-Notify keymaps
map("n", "<leader>u", "", { desc = "Notify" })
map("n", "<leader>uN", function()
  require("notify").dismiss { silent = true, pending = true }
end, { desc = "Delete all Notifications" })

-- Keymap untuk NvimTree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
-- NvimTree keymaps untuk buka/tutup folder/file
map("n", "l", function()
  require("nvim-tree.api").node.open.edit()
end, { buffer = true, desc = "Open file/folder in NvimTree", nowait = true })
map("n", "h", function()
  require("nvim-tree.api").node.navigate.parent_close()
end, { buffer = true, desc = "Close folder in NvimTree", nowait = true })

-- Keymap untuk close split and buffer
map("n", "<leader>bk", function()
  local winnr = vim.api.nvim_get_current_win()
  local bufnr = vim.api.nvim_get_current_buf()
  if vim.api.nvim_buf_is_valid(bufnr) then
    vim.api.nvim_buf_delete(bufnr, { force = true })
  end
  if #vim.api.nvim_list_wins() > 1 and vim.api.nvim_win_is_valid(winnr) then
    vim.api.nvim_win_close(winnr, true)
  end
end, { desc = "Close split and buffer" })

-- Keymap untuk quit Neovim
map("n", "<leader>q", ":qa<CR>", { desc = "Quit Neovim", noremap = true, silent = true })

-- Mode Visual
map("v", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map("v", "p", '"_dP', { desc = "Paste without overwriting yank" })
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })
map("v", "<C-A-j>", ":m '>+1<CR>gv=gv", { desc = "Move lines down" })
map("v", "<C-A-k>", ":m '<-2<CR>gv=gv", { desc = "Move lines up" })
map("v", "<C-A-S-j>", ":'<,'>t'><CR>gv=gv", { desc = "Duplicate block down" })
map("v", "<C-A-S-k>", ":'<,'>t-1<CR>gv=gv", { desc = "Duplicate block up" })

-- Mode Insert
map("i", "<C-l>", "<Esc>la", { desc = "Keluar dari kurung dan masuk insert" })
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })
map("i", "<C-Space>", function()
  require("cmp").complete()
end, { desc = "Trigger completion" })
map("i", "<C-A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
map("i", "<C-A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
map("i", "<C-A-S-j>", "<Esc>:t.<CR>gi", { desc = "Duplicate line down" })
map("i", "<C-A-S-k>", "<Esc>:t.-1<CR>gi", { desc = "Duplicate line up" })

-- Comment keymaps
map("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", { desc = "Toggle comment" })
map(
  "v",
  "<leader>/",
  "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Toggle comment" }
)
map(
  "n",
  "<leader>bc",
  "<cmd>lua require('Comment.api').toggle.blockwise.current()<CR>",
  { desc = "Toggle block comment" }
)
map(
  "v",
  "<leader>c",
  "<esc><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>",
  { desc = "Toggle block comment" }
)

-- Save with Ctrl+S
local function save_file()
  if vim.bo.modifiable and vim.bo.modified then
    vim.cmd "update"
  end
end
map({ "n", "i", "v" }, "<C-s>", save_file, { desc = "Save file (if modified)" })

-- Theme switcher
map("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "Switch NvChad theme" })

-- Auto format
map("n", "<leader>fm", function()
  if package.loaded["conform"] then
    require("conform").format { async = true, lsp_fallback = true }
  else
    vim.lsp.buf.format()
  end
end, { desc = "Auto format file" })

-- Folding
map("n", "zR", ":set foldlevel=99<CR>", { desc = "Maximize: Open all folds" })
map("n", "zM", ":set foldlevel=0<CR>", { desc = "Minimize: Close all folds" })
map("n", "za", "za", { desc = "Toggle fold" })
map("n", "zc", "zc", { desc = "Close fold" })
map("n", "zo", "zo", { desc = "Open fold" })
map("n", "zA", ":UfoEnable<CR>", { desc = "Enable UFO folding" })
map("n", "zD", ":UfoDisable<CR>", { desc = "Disable UFO folding" })

-- Preview fold - Commented out since minty.shades may not be installed
-- map("n", "<C-t>", function()
--   require("minty.shades").open { border = false }
-- end, { desc = "Preview fold" })

-- Mouse + NvimTree menu
map("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'
  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, { desc = "Open context menu" })

-- Close buffer
map("n", "<leader>x", function()
  local bufs = vim.fn.getbufinfo { buflisted = true }
  vim.api.nvim_buf_delete(0, { force = false })
  if #bufs <= 1 then
    vim.cmd "enew"
  end
end, { desc = "Close buffer" })

-- Plugin Manager (Lazy) keymap
map("n", "<leader>lp", "<cmd>Lazy<CR>", { desc = "Lazy Plugin Manager" })

-- Additional Telescope keybindings
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Search text in files" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "List open buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Search help tags" })

-- nvim-gemini-companion keymaps
map("n", "<leader>gg", "<cmd>GeminiToggle<CR>", { desc = "Toggle Gemini CLI" })
map("n", "<leader>gc", "<cmd>GeminiClose<CR>", { desc = "Close Gemini CLI process" })
map("n", "<leader>gD", "<cmd>GeminiSendFileDiagnostic<CR>", { desc = "Send File Diagnostics" })
map("n", "<leader>gd", "<cmd>GeminiSendLineDiagnostic<CR>", { desc = "Send Line Diagnostics" })
map("n", "<leader>gs", "<cmd>GeminiSwitchSidebarStyle<CR>", { desc = "Switch Sidebar Style" })
map("v", "<leader>gS", "<cmd>GeminiSend<CR>", { desc = "Send Selected Text to AI Agent" })

-- opencode.nvim keymaps
map("n", "<leader>oa", function()
  require("opencode").ask("@this: ", { submit = true })
end, { desc = "Ask about this" })
map({ "n", "v" }, "<leader>o+", function()
  require("opencode").prompt "@this"
end, { desc = "Add this" })
map("n", "<leader>os", function()
  require("opencode").select()
end, { desc = "Select prompt" })
map("n", "<leader>ot", function()
  require("opencode").toggle()
end, { desc = "Toggle embedded opencode" })
map("n", "<leader>oc", function()
  require("opencode").command()
end, { desc = "Select command" })
map("n", "<leader>on", function()
  require("opencode").command "session_new"
end, { desc = "New session" })
map("n", "<leader>oi", function()
  require("opencode").command "session_interrupt"
end, { desc = "Interrupt session" })
map("n", "<leader>oA", function()
  require("opencode").command "agent_cycle"
end, { desc = "Cycle selected agent" })
map("n", "<S-C-u>", function()
  require("opencode").command "messages_half_page_up"
end, { desc = "Messages half page up" })
map("n", "<S-C-d>", function()
  require("opencode").command "messages_half_page_down"
end, { desc = "Messages half page down" })

-- No highlight (remove search highlight)
map("n", "<leader>nh", ":nohlsearch<CR>", { desc = "Clear search highlight" })

-- Git Fugitive keymaps
map("n", "<leader>gf", "<cmd>Git<CR>", { desc = "Fugitive Git Status" })
map("n", "<leader>gfc", "<cmd>Git commit<CR>", { desc = "Git Commit" })
map("n", "<leader>gfp", "<cmd>Git push<CR>", { desc = "Git Push" })
map("n", "<leader>gfl", "<cmd>Git log<CR>", { desc = "Git Log" })
map("n", "<leader>gfL", "<cmd>Git log --oneline<CR>", { desc = "Git Log (oneline)" })
map("n", "<leader>gfb", "<cmd>Git branch<CR>", { desc = "Git Branch" })
map("n", "<leader>gfd", "<cmd>Gdiffsplit<CR>", { desc = "Git Diff" })
map("n", "<leader>gfr", "<cmd>Git rename<CR>", { desc = "Git Rename" })
map("n", "<leader>gfR", "<cmd>Git reset HEAD<CR>", { desc = "Git Reset HEAD" })
map("n", "<leader>gfs", "<cmd>Git stash<CR>", { desc = "Git Stash" })
map("n", "<leader>gfa", "<cmd>Git add --all<CR>", { desc = "Git Add All" })
map("n", "<leader>gfu", "<cmd>Git checkout HEAD -- %<CR>", { desc = "Git Undo Changes to File" })
map("n", "<leader>gfw", "<cmd>GBrowse<CR>", { desc = "Git Browse File/URL" })
map("n", "<leader>gfi", "<cmd>Git init<CR>", { desc = "Git Init" })

-- Buffer-sticks keymaps
map("n", "<leader>bj", function()
  require("buffer-sticks").jump()
end, { desc = "Jump to buffer" })
map("n", "<leader>bq", function()
  require("buffer-sticks").close()
end, { desc = "Close buffer" })
map("n", "<leader>bp", function()
  require("buffer-sticks").list {
    action = function(buffer, leave)
      print("Selected: " .. buffer.name)
      leave()
    end,
  }
end, { desc = "Buffer picker" })
map("n", "<leader>bt", function()
  require("buffer-sticks").toggle()
end, { desc = "Toggle buffer sticks" })
