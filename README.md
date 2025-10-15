# Neovim Configuration for Full Stack Development

This configuration is tailored for full stack web development with JavaScript/TypeScript, React, Node.js, PHP/Laravel, and Prisma.

## Features

### Language Support
- JavaScript/TypeScript with ESLint integration
- React/JSX syntax highlighting
- Node.js development
- PHP with Laravel support
- Prisma schema syntax highlighting
- HTML/CSS with Emmet support
- JSON/YAML/Markdown
- Shell scripting (Bash)
- Lua (for Neovim configuration)

### Key Plugins
- **LSP**: Language Server Protocol for intelligent code completion
- **Treesitter**: Enhanced syntax highlighting
- **Telescope**: Fuzzy finder for files, buffers, and more
- **NvimTree**: File explorer sidebar
- **Git Signs**: Git diff markers in the gutter
- **FkNotes**: Personal notes and task management with Obsidian integration
- **Fugitive**: Advanced Git integration for Neovim
- **Tiny Code Action**: Lightweight code actions menu
- **Comment**: Easy code commenting with `gcc`
- **AutoPairs**: Automatic closing of brackets and quotes
- **Indent Blankline**: Visual indentation guides
- **Trouble**: Pretty diagnostics list
- **Conform**: Code formatting with Prettier, Stylua, etc.
- **Bufferline**: Enhanced buffer/tab management
- **Noice**: Improved UI for messages, cmdline and popupmenu
- **Notify**: Better notification system
- **Colorizer**: Color highlighting for CSS, HTML, etc.
- **Floaterm**: Floating terminal emulator
- **Mini.nvim**: Collection of minimal plugins for various functionalities
- **UFO**: Better folding implementation
- **Tailwind Tools**: TailwindCSS colorizer and utilities

### Key Bindings
- `<leader> + ff`: Find files
- `<leader> + fg`: Live grep
- `<leader> + fb`: Find buffers
- `<leader> + c`: Comment/uncomment lines
- `<leader> + e`: Toggle file explorer
- `<leader> + x`: Close buffer
- `<leader> + bb`: Open buffer switcher (JABS/Barbar)
- `<leader> + te`: Open Telescope file browser
- `<leader> + th`: Switch themes
- `<leader> + fm`: Format file
- `<leader> + tt`: Toggle terminal manager
- `<leader> + tn`: New terminal session
- `<C-s>`: Save file (all modes)
- `gd`: Go to definition
- `gr`: Show references
- `K`: Show documentation
- `Ctrl + h/j/k/l`: Navigate between windows
- `<C-p>`: Toggle floaterm
- `<C-]>`: Accept Supermaven suggestion
- `<C-[>`: Clear Supermaven suggestion
- `<C-n>`: Next Supermaven suggestion
- `<C-p>`: Previous Supermaven suggestion
- `<leader> + gf`: Git status (Fugitive)
- `<leader> + gfc`: Git commit
- `<leader> + gfp`: Git push
- `<leader> + gfl`: Git log
- `<leader> + gfL`: Git log (oneline)
- `<leader> + gfb`: Git branch
- `<leader> + gfd`: Git diff
- `<leader> + gfr`: Git rename
- `<leader> + gfR`: Git reset HEAD
- `<leader> + gfs`: Git stash
- `<leader> + gfa`: Git add all
- `<leader> + gfu`: Git undo changes to file
- `<leader> + gfw`: Git browse file
- `<leader> + gfi`: Git init
- `<leader> + fn`: Open FkNotes Menu
- `<leader> + ft`: New Task
- `<leader> + fl`: Browse Tasks
- `<leader> + ca`: Code Action (Tiny)

### Code Formatting
Automatic code formatting on save with:
- Prettier for JavaScript/TypeScript/React/HTML/CSS/JSON
- Stylua for Lua files

## Installation Requirements

1. **Neovim 0.9+**
2. **Node.js** for JavaScript/TypeScript language servers
3. **PHP** for PHP development (optional)
4. **Git** for plugin management

### Language Servers
```bash
# Install Node.js and npm first, then:
npm install -g typescript typescript-language-server eslint prettier

# Optional for PHP development:
# Install Composer and PHP first, then:
# composer global require friendsofphp/php-cs-fixer

# Optional for Lua development (Neovim config):
# Install lua-language-server via your package manager or from:
# https://github.com/LuaLS/lua-language-server
```

### System Dependencies
```bash
# For formatting Lua code:
# Install stylua via cargo or your package manager:
# cargo install stylua
```

## Customization

You can customize this configuration by modifying files in:
- `~/.config/nvim/lua/plugins/init.lua`: Plugin configuration
- `~/.config/nvim/lua/configs/lspconfig.lua`: Language server settings
- `~/.config/nvim/lua/configs/conform.lua`: Formatting settings
- `~/.config/nvim/lua/mappings.lua`: Key bindings
- `~/.config/nvim/lua/options.lua`: Editor options

## Troubleshooting

If you encounter issues:
1. Run `:checkhealth` in Neovim to diagnose problems
2. Check that all language servers are properly installed
3. Run `:Lazy` to check plugin status and sync if needed
4. Ensure all system dependencies are installed

## Recent Updates

### Deprecation Fixes
- Updated `tsserver` to `ts_ls` to address deprecation warning
- Fixed Treesitter parser configuration to remove invalid `jsx` parser reference
- **Completely migrated from deprecated `require('lspconfig')` framework to new `vim.lsp.config` approach**

### Compatibility Notes
- Configuration now uses the **new `vim.lsp.config` framework** instead of deprecated methods
- Parser names updated to match current nvim-lspconfig conventions
- Treesitter configuration optimized for faster installation
- Removed `lua_ls` from default configuration to prevent startup errors if lua-language-server is not installed

### Migration to New Framework
The configuration has been updated to use the new `vim.lsp.config` framework introduced in nvim-lspconfig 0.11+, which will be required in v3.0.0. This ensures long-term compatibility and eliminates all deprecation warnings.

### Newly Added Plugins
1. **Comment.nvim** - Enhanced code commenting capabilities
2. **indent-blankline.nvim** - Visual indentation guides
3. **JABS.nvim** - Buffer management
4. **lspsaga.nvim** - Enhanced LSP UI
5. **mini.nvim** - Collection of minimal plugins:
   - mini.surround: Surround operations
   - mini.files: File explorer
   - mini.trailspace: Trim whitespace
   - mini.comment: Code commenting
   - mini.git: Git integration
6. **nvim-gemini-companion** - AI coding assistant (Qwen AI models)
7. **nvim-genghis** - File operations
8. **nvim-lint** - Linting framework
9. **nvim-notify** - Notification system
10. **nvim-treesitter-textobjects** - Advanced text objects
11. **nvim-ts-autotag** - Auto close/rename HTML tags
12. **nvim-ufo** - Folding engine
13. **opencode.nvim** - Code sharing
14. **promise-async** - Async utilities
15. **snacks.nvim** - Utility collection
16. **store.nvim** - State management
17. **tailwindcss-colorizer-cmp.nvim** - Tailwind CSS colorizer
18. **telescope-file-browser.nvim** - File browser for Telescope
19. **telescope-fzf-native.nvim** - Native fzf sorter for Telescope
20. **vim-floaterm** - Floating terminal
21. **buffer-sticks.nvim**
22. **modicator.nvim**

## Adding More Languages

To add support for more languages:
1. Add the language to `ensure_installed` in `lua/plugins/init.lua` (treesitter section)
2. Add the language server to the `servers` table in `lua/configs/lspconfig.lua`
3. Add the formatter to `formatters_by_ft` in `lua/configs/conform.lua`