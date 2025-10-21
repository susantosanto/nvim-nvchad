local map = vim.keymap.set

-- Floaterm keymaps
map("n", "<C-p>", ":FloatermToggle<CR>", { desc = "Toggle Floaterm" })
map({ "n", "t" }, "<C-j>", function()
  require("floaterm.api").cycle_term_bufs("prev")
end, { desc = "Cycle to previous Floaterm" })
map({ "n", "t" }, "<C-k>", function()
  require("floaterm.api").cycle_term_bufs("next")
end, { desc = "Cycle to next Floaterm" })

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
  local bufs = vim.fn.getbufinfo({ buflisted = true })
  vim.api.nvim_buf_delete(0, { force = false })
  if #bufs <= 1 then
    vim.cmd("enew")
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
  if pcall(require, "ufo") then
    require("ufo").openFoldsExceptKinds()
  else
    vim.cmd("set foldlevel=99")
  end
end, { desc = "Open all folds" })

map("n", "zm", function()
  if pcall(require, "ufo") then
    require("ufo").closeFoldsWith()
  else
    vim.cmd("set foldlevel=0")
  end
end, { desc = "Close all folds" })

-- Telescope File Browser keymap
map("n", "<leader>te", function()
  require("telescope").extensions.file_browser.file_browser({
    path = vim.fn.expand("%:p:h"), -- Memperbaiki masalah karakter spasi
    select_buffer = true,
    hijack_cwd = true, -- Mengikuti direktori saat ini
    attach_mappings = function(prompt_bufnr, map)
      map("i", "<C-s>", function()
        local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
        local selection = current_picker:get_selection()
        if selection then
          require("telescope.actions").close(prompt_bufnr)
          vim.cmd("split " .. selection.path)
        end
      end)
      map("i", "<C-v>", function()
        local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
        local selection = current_picker:get_selection()
        if selection then
          require("telescope.actions").close(prompt_bufnr)
          vim.cmd("vsplit " .. selection.path)
        end
      end)
      map("n", "s", function()
        local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
        local selection = current_picker:get_selection()
        if selection then
          require("telescope.actions").close(prompt_bufnr)
          vim.cmd("split " .. selection.path)
        end
      end)
      map("n", "v", function()
        local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
        local selection = current_picker:get_selection()
        if selection then
          require("telescope.actions").close(prompt_bufnr)
          vim.cmd("vsplit " .. selection.path)
        end
      end)
      return true
    end,
  })
end, { desc = "Open Telescope File Browser" })

-- Nvim-Notify keymaps
map("n", "<leader>u", "", { desc = "Notify" })
map("n", "<leader>uN", function()
  require("notify").dismiss({ silent = true, pending = true })
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

-- Keymaps untuk LSP functionality yang dinonaktifkan secara otomatis
map("n", "K", "", { desc = "LSP Documentation" })
map("n", "K", function()
  -- Hanya aktifkan jika LSP tersedia
  local clients = vim.lsp.get_clients()
  if #clients > 0 then
    vim.lsp.buf.hover()
  else
    -- Fall back to normal K behavior if no LSP
    vim.cmd("normal! " .. vim.v.count .. "k")
  end
end, { desc = "Show documentation (when LSP available)", noremap = true, silent = true })

map("n", "<leader>k", function()
  local clients = vim.lsp.get_clients()
  if #clients > 0 then
    vim.lsp.buf.signature_help()
  end
end, { desc = "Show signature help", noremap = true, silent = true })

map("n", "gd", function()
  local clients = vim.lsp.get_clients()
  if #clients > 0 then
    vim.lsp.buf.definition()
  else
    -- Fallback ke normal gd behavior
    vim.cmd("normal! " .. vim.v.count .. "gd")
  end
end, { desc = "Go to definition", noremap = true, silent = true })

-- Keymap untuk quit Neovim
map("n", "<leader>q", ":qa<CR>", { desc = "Quit Neovim", noremap = true, silent = true })

-- Mode Visual
map("v", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map("v", "p", '"_dP', { desc = "Paste without overwriting yank" })
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move lines down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move lines up" })
map("v", "<A-S-j>", ":'<,'>t'><CR>gv=gv", { desc = "Duplicate block down" })
map("v", "<A-S-k>", ":'<,'>t-1<CR>gv=gv", { desc = "Duplicate block up" })

-- Move line in Normal mode
map("n", "<A-j>", ":m+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m-2<CR>==", { desc = "Move line up" })

-- Duplicate line in Normal mode
map("n", "<A-S-j>", "Yp", { desc = "Duplicate line down" })
map("n", "<A-S-k>", "Y^-1p", { desc = "Duplicate line up" })

-- Mode Insert
map("i", "<C-l>", "<Esc>la", { desc = "Keluar dari kurung dan masuk insert" })
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })
map("i", "<C-Space>", function()
  require("cmp").complete()
end, { desc = "Trigger completion" })
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
map("i", "<A-S-j>", "<Esc>:t.<CR>gi", { desc = "Duplicate line down" })
map("i", "<A-S-k>", "<Esc>:t.-1<CR>gi", { desc = "Duplicate line up" })

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
    vim.cmd("update")
  end
end
map({ "n", "i", "v" }, "<C-s>", save_file, { desc = "Save file (if modified)" })

-- Auto format
map("n", "<leader>fm", function()
  if package.loaded["conform"] then
    require("conform").format({ async = true, lsp_fallback = true })
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
  vim.cmd.exec('"normal! \\<RightMouse>"')
  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, { desc = "Open context menu" })

-- Keyboard shortcut to open context menu
map("n", "<leader>cm", function()
  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = false })
end, { desc = "Open context menu with keyboard" })

-- Close buffer
map("n", "<leader>x", function()
  local bufs = vim.fn.getbufinfo({ buflisted = true })
  vim.api.nvim_buf_delete(0, { force = false })
  if #bufs <= 1 then
    vim.cmd("enew")
  end
end, { desc = "Close buffer" })

-- Close Buffers (close-buffers.nvim)
map(
  "n",
  "<leader>ch",
  "<cmd>lua require('close_buffers').delete({type = 'hidden'})<CR>",
  { desc = "Close hidden buffers" }
)
map(
  "n",
  "<leader>cu",
  "<cmd>lua require('close_buffers').delete({type = 'nameless'})<CR>",
  { desc = "Close nameless buffers" }
)
map(
  "n",
  "<leader>cb",
  "<cmd>lua require('close_buffers').delete({type = 'this'})<CR>",
  { desc = "Close current buffer (preserve layout)" }
)

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
  require("opencode").prompt("@this")
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
  require("opencode").command("session_new")
end, { desc = "New session" })
map("n", "<leader>oi", function()
  require("opencode").command("session_interrupt")
end, { desc = "Interrupt session" })
map("n", "<leader>oA", function()
  require("opencode").command("agent_cycle")
end, { desc = "Cycle selected agent" })
map("n", "<S-C-u>", function()
  require("opencode").command("messages_half_page_up")
end, { desc = "Messages half page up" })
map("n", "<S-C-d>", function()
  require("opencode").command("messages_half_page_down")
end, { desc = "Messages half page down" })

-- Bracket navigation (built-in % functionality plus alternatives)
-- Default % key works for matching brackets (), [], {}
-- Adding additional keymaps for convenience
-- The % key is already mapped by default in Neovim, so we don't need to remap it
map("n", "<leader>bb", "%", { desc = "Jump to matching bracket" })

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
  require("buffer-sticks").list({
    action = function(buffer, leave)
      print("Selected: " .. buffer.name)
      leave()
    end,
  })
end, { desc = "Buffer picker" })
map("n", "<leader>bt", function()
  require("buffer-sticks").toggle()
end, { desc = "Toggle buffer sticks" })

-- Typr plugin keymaps
map("n", "<leader>tt", "<cmd>Typr<CR>", { desc = "Open Typr typing practice" })
map("n", "<leader>ts", "<cmd>TyprStats<CR>", { desc = "Open Typr statistics" })

-- Twilight plugin keymaps
map("n", "<leader>tw", function()
  require("twilight").toggle()
end, { desc = "Toggle Twilight mode" })

-- Telescope Media Files keymaps
map("n", "<leader>fi", function()
  require("telescope").extensions.media_files.media_files()
end, { desc = "Find Media Files" })

-- Auto save plugin keymaps
map("n", "<leader>as", "<cmd>Autosave toggle<CR>", { desc = "Toggle autosave" })
map("n", "<leader>ae", "<cmd>Autosave on<CR>", { desc = "Enable autosave" })
map("n", "<leader>ad", "<cmd>Autosave off<CR>", { desc = "Disable autosave" })
map("n", "<leader>at", "<cmd>Autosave status<CR>", { desc = "Check autosave status" })

-- Theme switching functionality
local function switch_theme(theme_name)
  -- Update the theme in the chadrc config
  local chadrc_path = vim.fn.stdpath("config") .. "/lua/chadrc.lua"
  local chadrc_backup_path = vim.fn.stdpath("config") .. "/lua/chadrc.lua.bak"

  -- Create backup of the original file
  local original_content = {}
  for line in io.lines(chadrc_path) do
    table.insert(original_content, line)
  end

  local backup_file = io.open(chadrc_backup_path, "w")
  if backup_file then
    for _, line in ipairs(original_content) do
      backup_file:write(line .. "\n")
    end
    backup_file:close()
  end

  -- Read the original file content
  local lines = {}
  for line in io.lines(chadrc_path) do
    table.insert(lines, line)
  end

  -- Find and replace the theme line
  local found_theme = false
  for i, line in ipairs(lines) do
    if line:match('theme%s*=%s*"') then
      lines[i] = line:gsub('theme%s*=%s*"[^"]*"', 'theme = "' .. theme_name .. '"')
      found_theme = true
    end
  end

  if not found_theme then
    vim.notify("Could not find theme setting in chadrc.lua", vim.log.levels.WARN)
    return
  end

  -- Write the updated content back to the file
  local file = io.open(chadrc_path, "w")
  if file then
    for _, line in ipairs(lines) do
      file:write(line .. "\n")
    end
    file:close()
    -- Apply the new theme
    vim.g.nvchad_theme = theme_name
    dofile(vim.g.base46_cache .. "defaults")
    vim.notify("Theme changed to: " .. theme_name .. ". Backup created at: " .. chadrc_backup_path, vim.log.levels.INFO)
  else
    vim.notify("Could not update theme in chadrc.lua", vim.log.levels.ERROR)
  end
end

-- Theme picker function
local function theme_picker()
  local themes = {
    "onedark",
    "gruvbox",
    "tokyonight",
    "dracula",
    "nightowl",
    "edge",
    "solarized_dark",
    "solarized_light",
    "solarized_osaka",
    "everforest",
    "github_dark",
    "github_dark_dimmed",
    "ayu_dark",
    "ayu_mirage",
    "material",
    "nord",
    "jellybeans",
    "dark_red",
    "default",
  }

  local input = vim.fn.input("Choose a theme: ", "", "customlist,v:lua.vim.inspect(" .. vim.inspect(themes) .. ")")
  if input ~= "" then
    switch_theme(input)
  end
end

-- Theme switching keymaps
map("n", "<leader>td", ":Telescope themes<CR>", { desc = "Search for themes with Telescope" })

-- Register theme switching commands
vim.api.nvim_create_user_command("Theme", function(opts)
  if opts.args ~= "" then
    switch_theme(opts.args)
  else
    theme_picker()
  end
end, {
  nargs = "?",
  desc = "Switch NvChad theme",
  complete = function(arg_lead, cmd_line, cursor_pos)
    local themes = {
      "onedark",
      "gruvbox",
      "tokyonight",
      "dracula",
      "nightowl",
      "edge",
      "solarized_dark",
      "solarized_light",
      "solarized_osaka",
      "everforest",
      "github_dark",
      "github_dark_dimmed",
      "ayu_dark",
      "ayu_mirage",
      "material",
      "nord",
      "jellybeans",
      "dark_red",
      "default",
    }
    return vim.tbl_filter(function(theme)
      return vim.startswith(theme, arg_lead)
    end, themes)
  end,
})

-- Search and Replace
map("n", "<leader>sr", ":%s/", { desc = "Search and replace in file" })
map("n", "<leader>sra", ":%s//g<Left><Left>", { desc = "Search and replace all in file" })
map("n", "<leader>src", ":%s//gc<Left><Left>", { desc = "Search and replace all in file with confirm" })

-- Tab management
map("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })
map("n", "<leader>tfe", ":tabedit ", { desc = "Tab edit file" }) -- Mengganti dari <leader>te ke <leader>tef
map("n", "<leader>tc", ":tabclose<CR>", { desc = "Close current tab" })
map("n", "<leader>to", ":tabonly<CR>", { desc = "Close other tabs" })
map("n", "<leader>tf", ":tabfirst<CR>", { desc = "Go to first tab" })
map("n", "<leader>tl", ":tablast<CR>", { desc = "Go to last tab" })
map("n", "<leader>tp", ":tabprevious<CR>", { desc = "Go to previous tab" })
-- Mapping untuk pergi ke tab tertentu (1-9)
for i = 1, 5 do
  map("n", "<leader>" .. i, ":" .. i .. "tabnext<CR>", { desc = "Go to tab " .. i })
end

-- Terminal management
map("n", "<leader>tt", ":terminal<CR>", { desc = "Open terminal" })
map("n", "<leader>tv", ":vsplit term://$SHELL<CR>", { desc = "Vertical split terminal" })
map("n", "<leader>th", ":split term://$SHELL<CR>", { desc = "Horizontal split terminal" })
map("t", "<A-[>", "<C-\\><C-N>", { desc = "Terminal to Normal mode" }) -- Alt+[ untuk keluar dari terminal
map("t", "<A-]>", "<C-\\><C-N><C-w>", { desc = "Terminal escape and window command" }) -- Alt+] untuk keluar dan window command

-- Function to rename HTML/XML tags (works with JSX/TSX)
local function rename_html_tag()
  local function get_current_tag()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]
    if not line then
      return nil, nil, nil
    end

    -- Find tag under cursor
    local start_col, end_col = line:find("<[/]?%w+[^>]*>", col)
    if not start_col then
      -- Try to find closing tag if cursor is after >
      start_col, end_col = line:find("</%w+[^>]*>", col)
    end

    if start_col then
      local tag_content = line:sub(start_col, end_col)
      local is_closing = tag_content:match("^</")
      local tag_name = tag_content:match("<[/]?([^%s/>]+)")

      if tag_name then
        return tag_name, start_col - 1, is_closing, row -- Return 0-indexed column
      end
    end
    return nil, nil, nil
  end

  local function find_matching_tag(tag_name, is_closing, start_row, start_col)
    local current_row, _ = unpack(vim.api.nvim_win_get_cursor(0))
    local total_lines = vim.api.nvim_buf_line_count(0)
    local search_backward = is_closing

    if search_backward then
      -- Search backward for opening tag
      for row = start_row - 1, 1, -1 do
        local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1] or ""
        local pattern = "<" .. tag_name .. "[^>]*>"
        local s, e = line:find(pattern, 1, true)
        if s and not line:sub(s, e):match("^</") then
          return row, s - 1
        end
      end
    else
      -- Search forward for closing tag
      for row = start_row + 1, total_lines do
        local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1] or ""
        local pattern = "</" .. tag_name .. "[^>]*>"
        local s, e = line:find(pattern, 1, true)
        if s then
          return row, s - 1
        end
      end
    end
    return nil, nil
  end

  local tag_name, tag_col, is_closing = get_current_tag()
  if not tag_name then
    vim.notify("No HTML tag found under cursor", vim.log.levels.WARN)
    return
  end

  local new_tag = vim.fn.input("Rename '" .. tag_name .. "' to: ", tag_name)
  if new_tag == "" or new_tag == tag_name then
    return
  end

  -- Get current cursor position
  local current_row, current_col = unpack(vim.api.nvim_win_get_cursor(0))

  -- Replace current tag
  local current_line = vim.api.nvim_buf_get_lines(0, current_row - 1, current_row, false)[1]
  -- First replace opening tags with attributes
  local updated_line = current_line:gsub("<" .. tag_name .. "%s*([^>]-)>", function(attributes)
    return "<" .. new_tag .. " " .. attributes .. ">"
  end)
  -- Then replace opening tags without attributes
  updated_line = updated_line:gsub("<" .. tag_name .. ">", "<" .. new_tag .. ">")
  -- Finally replace closing tags
  updated_line = updated_line:gsub("</" .. tag_name .. ">", "</" .. new_tag .. ">")
  vim.api.nvim_buf_set_lines(0, current_row - 1, current_row, false, { updated_line })

  -- Find and replace matching tag
  local match_row, match_col = find_matching_tag(tag_name, is_closing, current_row, tag_col)
  if match_row then
    local match_line = vim.api.nvim_buf_get_lines(0, match_row - 1, match_row, false)[1]
    -- First replace opening tags with attributes
    local updated_match_line = match_line:gsub("<" .. tag_name .. "%s*([^>]-)>", function(attributes)
      return "<" .. new_tag .. " " .. attributes .. ">"
    end)
    -- Then replace opening tags without attributes
    updated_match_line = updated_match_line:gsub("<" .. tag_name .. ">", "<" .. new_tag .. ">")
    -- Finally replace closing tags
    updated_match_line = updated_match_line:gsub("</" .. tag_name .. ">", "</" .. new_tag .. ">")
    vim.api.nvim_buf_set_lines(0, match_row - 1, match_row, false, { updated_match_line })
  end

  vim.notify("Renamed tag '" .. tag_name .. "' to '" .. new_tag .. "'", vim.log.levels.INFO)
end

-- Keymap to rename HTML/XML tags
map("n", "<leader>rt", rename_html_tag, { desc = "Rename HTML/XML tag and its pair" })

-- Keymaps untuk LSP functionality yang dinonaktifkan secara otomatis
map("n", "K", function()
  -- Hanya aktifkan jika LSP tersedia
  local clients = vim.lsp.get_clients()
  if #clients > 0 then
    vim.lsp.buf.hover()
  else
    -- Fall back to normal K behavior if no LSP
    vim.cmd("normal! " .. vim.v.count .. "k")
  end
end, { desc = "Show documentation (when LSP available)", noremap = true, silent = true })

map("n", "<leader>k", function()
  local clients = vim.lsp.get_clients()
  if #clients > 0 then
    vim.lsp.buf.signature_help()
  end
end, { desc = "Show signature help", noremap = true, silent = true })

map("n", "gd", function()
  local clients = vim.lsp.get_clients()
  if #clients > 0 then
    vim.lsp.buf.definition()
  else
    -- Fallback ke normal gd behavior
    vim.cmd("normal! " .. vim.v.count .. "gd")
  end
end, { desc = "Go to definition", noremap = true, silent = true })

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
