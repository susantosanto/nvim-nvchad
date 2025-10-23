local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden", -- Include hidden files
      "--glob=!.git/*", -- Exclude git directory
      "--glob=!node_modules/*", -- Exclude node_modules
      "--glob=!dist/*", -- Exclude dist folders
      "--glob=!build/*", -- Exclude build folders
      "--glob=!coverage/*", -- Exclude coverage folders
      "--glob=!*.min.js", -- Exclude minified JS files
      "--glob=!*.min.css", -- Exclude minified CSS files
    },

    mappings = {
      i = {
        ["<Down>"] = actions.cycle_history_next,
        ["<Up>"] = actions.cycle_history_prev,
        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,
        ["<C-c>"] = actions.close,
        ["<Enter>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,
        ["?"] = actions.which_key,
      },
    },
  },
  pickers = {
    find_files = {
      -- Configure find_files to respect .gitignore and exclude heavy directories
      find_command = { "rg", "--files", "--hidden", "--glob=!.git/*", "--glob=!node_modules/*" },
    },
    live_grep = {
      -- Additional vimgrep_arguments to exclude common heavy directories
      additional_args = function(opts)
        return { "--hidden", "--glob=!.git/*", "--glob=!node_modules/*", "--glob=!dist/*", "--glob=!build/*" }
      end
    },
    grep_string = {
      -- Additional vimgrep_arguments to exclude common heavy directories
      additional_args = function(opts)
        return { "--hidden", "--glob=!.git/*", "--glob=!node_modules/*", "--glob=!dist/*", "--glob=!build/*" }
      end
    }
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode key maps
        },
        ["n"] = {
          -- your custom normal mode key maps
        },
      },
    },
    media_files = {
      filetypes = {"png", "jpg", "jpeg", "gif", "mp4", "webm", "pdf", "epub"},
      -- find command (using fdfind which is fd on some systems like Ubuntu)
      find_cmd = "fdfind",
    },
  },
}