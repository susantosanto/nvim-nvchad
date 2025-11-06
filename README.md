# Neovim IDE: Professional Development Environment

*A modern, powerful, and extensible Neovim configuration designed for full-stack developers. This configuration transforms Neovim into a professional IDE with cutting-edge features, AI assistance, and seamless workflows.*

---

## 🌟 Overview

This is a **comprehensive Neovim IDE configuration** crafted for modern full-stack development. It provides an elegant, professional environment with intelligent code completion, AI-powered assistance, advanced debugging tools, and seamless integration with popular frameworks and languages.

Whether you're building React applications, developing Node.js services, working with Laravel backends, or managing databases with Prisma, this configuration offers everything needed for productive development.

---

## 🚀 Key Features

### 🔧 Development Excellence

- **Multi-Cursor Editing**: VS Code-style multi-cursor operations with visual-multi
- **Advanced LSP Integration**: Intelligent code completion, diagnostics, and refactoring
- **Real-time Collaboration**: Shared editing sessions with team members
- **Smart Snippets**: Context-aware code templates for rapid development

### 🎨 Professional UI/UX
- **Modern Dashboard**: Sleek welcome screen with quick actions
- **Enhanced Syntax Highlighting**: Treesitter-powered accurate coloring
- **Dynamic Color Scheme**: Adaptive themes for different lighting conditions
- **Visual Indicators**: Git signs, diagnostics, and context-aware highlights
- **Distraction-Free Mode**: Focus mode for deep work sessions

### ⚡ Performance Optimization
- **Lazy Loading**: Plugins loaded only when needed
- **Memory Management**: Efficient resource utilization
- **Asynchronous Operations**: Non-blocking file operations and searches
- **Smart Caching**: Optimized startup times with persistent caching

---

## 📦 Installed Plugins

### 💡 Artificial Intelligence & Assistance

- **FkNotes** - Personal note-taking system with Obsidian integration
- **Nvim-Gemini-Companion** - Qwen AI models integration for code assistance
- **Opencode.nvim** - Collaborative code sharing and review platform
- **Tiny-Code-Action** - Minimal code action interface
- **Undo-Glow.nvim** - Visual feedback for undo, redo, yank, paste, search operations

### 🖱️ Multi-Cursor & Editing
- **vim-visual-multi** - VS Code-style multi-cursor editing with intuitive shortcuts
- **moveline.nvim** - Move lines with Alt+j/k

### 🧠 Language Intelligence
- **nvim-lspconfig** - Language server protocol integration
- **nvim-cmp** - Advanced completion engine with fuzzy matching
- **Treesitter** - Precise syntax parsing and highlighting
- **Typescript.nvim** - Enhanced TypeScript/JavaScript support
- **PHPactor** - PHP language intelligence
- **Prisma.nvim** - Prisma schema syntax highlighting
- **nvim-lint** - Linting support
- **conform.nvim** - Formatting support

### 🎯 Navigation & Search
- **Telescope** - Fuzzy finder for files, buffers, and code
- **NvimTree** - File explorer with Git integration
- **Which-Key** - Interactive key binding guide
- **Hop.nvim** - Efficient character navigation
- **Flash.nvim** - Lightning-fast motion system
- **dropbar.nvim** - Breadcrumbs like VS Code/ JetBrains
- **nvim-biscuits** - Show context at the end of long lines

### 🛠️ Development Tools
- **Trouble** - Pretty diagnostics list and quick fixes
- **Neogen** - Documentation generation
- **Comment** - Smart code commenting
- **Surround** - Text object manipulation (both nvim-surround and mini.surround)
- **AutoPairs** - Automatic bracket and quote pairing
- **Autotag** - HTML/XML tag auto-closing
- **nvim-ufo** - Advanced code folding
- **Beacon** - Highlight cursor movements for better visibility

### 🎨 UI Enhancements
- **Bufferline** - Enhanced tab and buffer management
- **Lualine** - Beautiful status line
- **Indent Blankline** - Visual indentation guides (minimized)
- **Colorizer** - Color code highlighting
- **Noice** - Improved notifications and UI elements
- **Notify** - Elegant notification system
- **Twilight** - Focus mode for reduced distractions
- **smear-cursor.nvim** - Smooth cursor animation

### 🌐 Web Development
- **Tailwind Tools** - Tailwind CSS utilities and colorizer
- **Volar** - Vue.js development support
- **Emmet** - HTML/CSS abbreviation expansion
- **Live Server** - Local development server integration
- **tailwind-autosort.nvim** - Automatic sorting of Tailwind CSS classes

### 🐛 Debugging & Testing
- **DAP** - Debug Adapter Protocol integration
- **Neotest** - Testing framework with live results
- **Coverage** - Code coverage visualization

### 📚 Productivity
- **Todo Comments** - Task and annotation tracking
- **Gitsigns** - Git integration with inline diffs
- **Fugitive** - Powerful Git client
- **Floaterm** - Floating terminal emulator
- **Session Manager** - Workspace persistence
- **autosave.nvim** - Auto save plugin
- **store.nvim** - Plugin for storing and retrieving code snippets/notes
- **Undotree** - Visualize undo history

### 🎯 Specialized Functionality
- **Mini.nvim** - Collection of minimal utility plugins (mini.animate, mini.pairs, mini.surround, mini.trailspace, mini.files)
- **Snacks.nvim** - Essential productivity enhancements
- **Rainbow delimiters** - Nested parentheses colorization
- **Treesitter Context** - Show context for code blocks
- **markview.nvim** - Markdown preview plugin
- **buffer-sticks.nvim** - Quick buffer switching
- **typr.nvim** - Typing practice plugin
- **close-buffers.nvim** - Close multiple buffers
- **inc-rename.nvim** - Incremental rename with real-time preview
- **tiny-inline-diagnostic.nvim** - Inline diagnostic display for errors/warnings

---

## 🎹 Key Bindings

### 🤖 AI & Multi-Cursor
| Shortcut | Function | Description |
|----------|----------|-------------|
| `Alt+d` | Select Next | Multi-cursor selection of next occurrence |
| `Alt+j` | Add Cursor Below | Add cursor to line below |
| `Alt+k` | Add Cursor Above | Add cursor to line above |
| `Alt+x` | Skip Selection | Skip current multi-cursor selection |
| `Alt+p` | Remove Last | Remove last multi-cursor selection |

| `Alt+c` | Clear AI Suggestion | Clear current AI suggestion |
| `Alt+w` | Accept AI Word | Accept single word from AI suggestion |

### 🔍 Navigation & Search
| Shortcut | Function | Description |
|----------|----------|-------------|
| `Space Space` | Find Files | Search files with fuzzy finder |
| `Space fg` | Live Grep | Search text across project |
| `Space fb` | Find Buffers | Switch between open buffers |
| `Space te` | File Browser | Browse files in tree view |
| `]t` | Next Todo Comment | Jump to next todo comment |
| `[t` | Previous Todo Comment | Jump to previous todo comment |

### 📁 File Operations
| Shortcut | Function | Description |
|----------|----------|-------------|
| `Space e` | Toggle Explorer | Show/hide file explorer |
| `Space tn` | New Tab | Create new tab |
| `Space tc` | Close Tab | Close current tab |
| `Space x` | Close Buffer | Close current buffer |
| `Space bk` | Close Split and Buffer | Close current window and buffer |

### 💻 Development
| Shortcut | Function | Description |
|----------|----------|-------------|
| `Space fm` | Format Code | Auto-format current file |
| `Space ca` | Code Action | Trigger code action menu |
| `Space cc` | Toggle Comment | Comment/uncomment selected lines |
| `Space cy` | Copy Whole File | Copy entire file to clipboard |
| `Space rt` | Rename HTML/XML tag | Rename tag and its pair |
| `gd` | Go to Definition | Jump to variable/function definition |
| `gr` | Find References | Show all references to symbol |
| `K` | Show Documentation | Display hover documentation |

### 🐛 Debugging
| Shortcut | Function | Description |
|----------|----------|-------------|
| `Space tt` | Toggle Terminal | Show/hide integrated terminal |
| `Space td` | Debug Start | Start debugging session |
| `F5` | Continue | Resume debug execution |
| `F10` | Step Over | Step over current line |

### 🎨 UI Controls
| Shortcut | Function | Description |
|----------|----------|-------------|
| `Space th` | Theme Switcher | Change editor theme |
| `Space tw` | Toggle Twilight | Enable/disable focus mode |
| `Space nh` | No Highlight | Clear search highlighting |

### 🔄 Git Operations
| Shortcut | Function | Description |
|----------|----------|-------------|
| `Space gg` | Git Status | Show current git status |
| `Space gc` | Git Commit | Commit current changes |
| `Space gp` | Git Push | Push commits to remote |
| `Space gl` | Git Log | View commit history |

### 📦 Plugin-Specific Keymaps

#### Nvim-Surround (separate from mini.surround)
| Shortcut | Function | Description |
|----------|----------|-------------|
| `ysiw)` | Surround Inner Word with Parentheses | Wrap current word in parentheses |
| `ysiw"` | Surround Inner Word with Quotes | Wrap current word in quotes |
| `cs"'` | Change Surround from Quotes to Apostrophes | Replace quotes with apostrophes |
| `ds"` | Delete Surround | Remove quotes around text |
| `ys{motion}t` | Surround with HTML Tag | Prompt for HTML tag name |

#### Mini.surround (via leader+m prefix)
| Shortcut | Function | Description |
|----------|----------|-------------|
| `<leader>+msa` | Add Surround | Add surrounding brackets/quotes |
| `<leader>+msd` | Delete Surround | Delete surrounding brackets/quotes |
| `<leader>+msr` | Replace Surround | Replace surrounding brackets/quotes |
| `<leader>+msf` | Find Surround | Find surrounding brackets/quotes |

#### Mini.files (via leader+m prefix)
| Shortcut | Function | Description |
|----------|----------|-------------|
| `<leader>+mf` | Open Mini.files (current dir) | File explorer for current file directory |
| `<leader>+mF` | Open Mini.files (working dir) | File explorer for working directory |

#### Mini.trailspace (via leader+m prefix)
| Shortcut | Function | Description |
|----------|----------|-------------|
| `<leader>+mtw` | Trim Whitespace | Remove trailing whitespace |
| `<leader>+mtl` | Trim Last Lines | Remove empty last lines |

#### Telescope Extensions
| Shortcut | Function | Description |
|----------|----------|-------------|
| `Space fi` | Find Media Files | Search for images and media files |

#### Floaterm Keymaps
| Shortcut | Function | Description |
|----------|----------|-------------|
| `Ctrl+p` | Toggle Floaterm | Open/close floating terminal |
| `Ctrl+j` | Cycle to Previous Floaterm | Navigate between terminals |
| `Ctrl+k` | Cycle to Next Floaterm | Navigate between terminals |

#### Git Operations (Gitsigns)
| Shortcut | Function | Description |
|----------|----------|-------------|
| `Space gj` | Next Git Hunk | Move to next Git hunk |
| `Space gk` | Previous Git Hunk | Move to previous Git hunk |
| `Space gp` | Preview Git Hunk | Preview Git hunk |
| `Space gr` | Reset Git Hunk | Reset Git hunk |
| `Space gs` | Stage Git Hunk | Stage Git hunk |
| `Space gu` | Undo Stage Git Hunk | Undo stage Git hunk |
| `Space gts` | Toggle Signs | Toggle Git signs |
| `Space gtn` | Toggle Number Highlight | Toggle Git number highlighting |
| `Space gtl` | Toggle Line Highlight | Toggle Git line highlighting |
| `Space gtw` | Toggle Word Diff | Toggle Git word diff |
| `Space gtb` | Toggle Current Line Blame | Toggle Git blame |

#### Nvim-UFO Folding
| Shortcut | Function | Description |
|----------|----------|-------------|
| `zr` | Open All Folds | Open all folds in file |
| `zm` | Close All Folds | Close all folds in file |
| `zR` | Maximize Folds | Open all folds (alternative) |
| `zM` | Minimize Folds | Close all folds (alternative) |
| `zA` | Enable UFO Folding | Enable advanced folding |
| `zD` | Disable UFO Folding | Disable advanced folding |

#### Buffer Operations
| Shortcut | Function | Description |
|----------|----------|-------------|
| `Space ch` | Close Hidden Buffers | Close all hidden buffers |
| `Space cu` | Close Nameless Buffers | Close nameless buffers |
| `Space cb` | Close Current Buffer (preserve layout) | Close current buffer while preserving window layout |

#### AI Assistant (nvim-gemini-companion)
| Shortcut | Function | Description |
|----------|----------|-------------|
| `Space gg` | Toggle Gemini CLI | Toggle AI assistant panel |
| `Space gc` | Close Gemini CLI | Close AI assistant process |
| `Space gD` | Send File Diagnostics | Send file diagnostics to AI |
| `Space gd` | Send Line Diagnostics | Send line diagnostics to AI |
| `Space gs` | Switch Sidebar Style | Switch AI sidebar style |
| `v+Space gS` | Send Selected Text | Send selected text to AI |

#### Opencode.nvim
| Shortcut | Function | Description |
|----------|----------|-------------|
| `Space oa` | Ask About This | Ask AI about current context |
| `Space o+` | Add This | Add prompt to opencode |
| `Space os` | Select Prompt | Select a prompt |
| `Space ot` | Toggle Opencode | Toggle embedded opencode |
| `Space oc` | Select Command | Select a command |
| `Space on` | New Session | Start a new session |
| `Space oi` | Interrupt Session | Interrupt current session |
| `Space oA` | Cycle Agent | Cycle through available agents |
| `Shift+Ctrl+u` | Messages Half Page Up | Scroll messages up |
| `Shift+Ctrl+d` | Messages Half Page Down | Scroll messages down |

#### Auto Save Plugin
| Shortcut | Function | Description |
|----------|----------|-------------|
| `Space as` | Toggle Autosave | Toggle autosave on/off |
| `Space ae` | Enable Autosave | Enable autosave |
| `Space ad` | Disable Autosave | Disable autosave |
| `Space at` | Check Autosave Status | Check current autosave status |

#### Typing Practice (Typr)
| Shortcut | Function | Description |
|----------|----------|-------------|
| `Space tt` | Open Typing Practice | Open typing practice interface |
| `Space ts` | Open Typing Statistics | Open typing statistics |

#### Theme Switching
| Command | Function | Description |
|---------|----------|-------------|
| `:Theme [theme_name]` | Switch Theme | Switch to the specified theme |
| `Space td` | Search for Themes | Search for themes with Telescope |

#### Search and Replace
| Shortcut | Function | Description |
|----------|----------|-------------|
| `Space sr` | Search and Replace | Start search and replace in file |
| `Space sra` | Search and Replace All | Replace all occurrences in file |
| `Space src` | Search and Replace All with Confirm | Replace all with confirmation |

#### Window Navigation
| Shortcut | Function | Description |
|----------|----------|-------------|
| `Ctrl+j` | Move to Window Below | Move to window below |
| `Ctrl+k` | Move to Window Above | Move to window above |
| `Ctrl+h` | Move to Window Left | Move to window left |
| `Ctrl+l` | Move to Window Right | Move to window right |

#### Line Movement (moveline.nvim)
| Mode | Shortcut | Function | Description |
|------|----------|----------|-------------|
| Normal | `Alt+j` | Move Line Down | Move current line down |
| Normal | `Alt+k` | Move Line Up | Move current line up |
| Normal | `Alt+Shift+j` | Duplicate Line Down | Duplicate current line down |
| Normal | `Alt+Shift+k` | Duplicate Line Up | Duplicate current line up |
| Visual | `Alt+j` | Move Lines Down | Move selected lines down |
| Visual | `Alt+k` | Move Lines Up | Move selected lines up |
| Visual | `Alt+Shift+j` | Duplicate Block Down | Duplicate selected block down |
| Visual | `Alt+Shift+k` | Duplicate Block Up | Duplicate selected block up |

#### Terminal Management
| Shortcut | Function | Description |
|----------|----------|-------------|
| `Space tt` | Open Terminal | Open terminal in a new buffer |
| `Space tv` | Vertical Split Terminal | Open terminal in vertical split |
| `Space th` | Horizontal Split Terminal | Open terminal in horizontal split |
| `Alt+[` | Terminal to Normal Mode | Exit terminal mode and return to normal mode |
| `Alt+]` | Terminal Escape and Window Command | Exit terminal and enter window command |

#### Tab Management
| Shortcut | Function | Description |
|----------|----------|-------------|
| `Space t1-5` | Go to Tab 1-5 | Switch to specific tab (1-5) |
| `Space tf` | Go to First Tab | Switch to first tab |
| `Space tl` | Go to Last Tab | Switch to last tab |
| `Space tp` | Go to Previous Tab | Switch to previous tab |
| `Space to` | Close Other Tabs | Close all tabs except current |

---

## 🛠️ Installation Requirements

### 🖥️ System Dependencies
```bash
# Essential packages
sudo apt update
sudo apt install -y \
  neovim \
  git \
  curl \
  wget \
  ripgrep \
  fd-find \
  unzip \
  build-essential \
  ninja-build \
  cmake \
  gettext

# Node.js for JavaScript/TypeScript support
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Python for plugin support
sudo apt install -y python3 python3-pip

# Clipboard support (for WSL)
sudo apt install -y xclip
```

### 🔤 Font Requirements
```bash
# Install Nerd Fonts for icons
mkdir -p ~/.fonts
cd ~/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
unzip JetBrainsMono.zip
fc-cache -fv
```

### 📦 Language Servers
```bash
# JavaScript/TypeScript
npm install -g typescript typescript-language-server eslint prettier

# Python
pip3 install python-lsp-server[all]

# Lua
# Install lua-language-server via your package manager or from:
# https://github.com/LuaLS/lua-language-server

# PHP
# Install Composer and PHP first, then:
# composer global require friendsofphp/php-cs-fixer

# Vue.js
npm install -g @volar/vue-language-server

# Tailwind CSS
npm install -g tailwindcss-language-server

# Prisma
npm install -g prisma-language-server
```

### 🎨 Formatting Tools
```bash
# Install formatters
npm install -g prettier stylua
cargo install stylua  # Alternative installation method
```

---

## 🐧 Linux Installation Guide

### Ubuntu/Debian
```bash
#!/bin/bash
# Update package list
sudo apt update

# Install core dependencies
sudo apt install -y \
  neovim=0.9* \
  git \
  curl \
  wget \
  ripgrep \
  fd-find \
  unzip \
  build-essential \
  ninja-build \
  cmake \
  gettext \
  xclip

# Install Node.js LTS
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install Python support
sudo apt install -y python3 python3-pip

# Install Nerd Fonts
mkdir -p ~/.fonts
cd ~/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
unzip JetBrainsMono.zip
fc-cache -fv
cd ~

echo "Linux dependencies installed successfully!"
```

### Arch Linux
```bash
#!/bin/bash
# Install dependencies
sudo pacman -Syu --noconfirm \
  neovim \
  git \
  curl \
  wget \
  ripgrep \
  fd \
  unzip \
  base-devel \
  ninja \
  cmake \
  gettext \
  xclip

# Install Node.js LTS
sudo pacman -S --noconfirm nodejs-lts nodejs-lts npm

# Install Python support
sudo pacman -S --noconfirm python python-pip

# Install Nerd Fonts
mkdir -p ~/.fonts
cd ~/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
unzip JetBrainsMono.zip
fc-cache -fv
cd ~

echo "Arch Linux dependencies installed successfully!"
```

---

## 🪟 Windows Installation Guide

### PowerShell (Administrator)
```powershell
# Install Chocolatey package manager
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install dependencies
choco install -y neovim git curl wget ripgrep fd unzip cmake gettext nodejs-lts python3

# Install Python pip
python -m ensurepip --upgrade

# Download Nerd Fonts
New-Item -ItemType Directory -Path "$HOME\.fonts" -Force
Set-Location -Path "$HOME\.fonts"
Invoke-WebRequest -Uri "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip" -OutFile "JetBrainsMono.zip"
Expand-Archive -Path "JetBrainsMono.zip" -DestinationPath "." -Force
# Manual font installation required via Windows Font Settings

Set-Location -Path "$HOME"
Write-Host "Windows dependencies installed successfully!"
```

### WSL (Windows Subsystem for Linux)
```bash
# Follow the Ubuntu/Debian installation guide above
# WSL provides a complete Linux environment on Windows
```

---

## 🧪 Language Server Installation

### JavaScript/TypeScript
```bash
npm install -g typescript typescript-language-server eslint prettier
```

### Python
```bash
pip3 install python-lsp-server[all] pyright
```

### Lua
```bash
# Via package manager
sudo apt install lua-language-server  # Ubuntu 22.04+

# Or compile from source
git clone https://github.com/LuaLS/lua-language-server
cd lua-language-server
./make.sh
```

### PHP
```bash
# Install Composer first
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Install PHP language server
composer global require felixfbecker/language-server
```

### Vue.js
```bash
npm install -g @volar/vue-language-server
```

### Tailwind CSS
```bash
npm install -g tailwindcss-language-server
```

### Prisma
```bash
npm install -g prisma-language-server
```

---

## 🎨 Customization Options

### Theme Management
```lua
-- Change theme in ~/.config/nvim/lua/chadrc.lua
M.base46 = {
  theme = "tokyonight",  -- Available: tokyonight, gruvbox, dracula, etc.
  transparency = true,
}
```

### Plugin Configuration
```lua
-- Add/remove plugins in ~/.config/nvim/lua/plugins/init.lua
-- Customize plugin behavior in respective config files
```

### Key Bindings
```lua
-- Modify keymaps in ~/.config/nvim/lua/mappings.lua
-- All keymaps are fully customizable
```

### LSP Configuration
```lua
-- Configure language servers in ~/.config/nvim/lua/configs/lspconfig.lua
-- Add new languages or modify existing configurations
```

---

## 🔧 Troubleshooting Common Issues

### Plugin Loading Errors
```bash
# Run to diagnose plugin issues
nvim -c ":Lazy"
# Then press 's' to sync plugins
```

### Language Server Problems
```bash
# Check LSP status
nvim -c ":LspInfo"
# Shows active language servers and their status
```

### Performance Issues
```bash
# Profile startup time
nvim --startuptime startup.log -c ":quit"
# Analyze startup.log for bottlenecks
```

### Font Rendering Issues
1. Ensure Nerd Fonts are installed correctly
2. Set terminal font to JetBrainsMono Nerd Font
3. Restart Neovim after font changes

---

## 🔄 Recent Enhancements

### AI Integration

- **Conflict-free keymaps** ensuring smooth operation
- **Customizable AI suggestions** with dedicated shortcuts

### Multi-Cursor Enhancement
- **Visual-Multi plugin** for VS Code-style multi-cursor editing
- **Non-conflicting keyboard shortcuts** using Alt combinations
- **Intuitive operation** similar to mainstream editors

### Performance Improvements
- **Optimized lazy loading** for faster startup
- **Memory-efficient configurations** for low-resource systems
- **Asynchronous operations** preventing UI freezes

### Compatibility Updates
- **WSL and Windows support** with proper clipboard integration
- **Cross-platform configurations** working seamlessly
- **Updated plugin dependencies** for latest features

---

## 📈 Future Roadmap

### AI & Automation
- Enhanced AI code refactoring capabilities
- Automated test generation with AI assistance
- Smart code review suggestions

### Developer Experience
- Integrated debugging with visual breakpoints
- Live collaboration features
- Advanced snippet management system

### Platform Support
- Native Windows support improvements
- Cloud-based development environments
- Containerized development workflows

---

## 📄 License

This Neovim configuration is provided as-is for educational and personal use. Feel free to modify and adapt it to your needs.

**Note**: Individual plugins may have their own licenses. Please refer to each plugin's repository for licensing information.

---

### 📚 Plugin Usage Documentation

#### nvim-surround - Text Surrounding Plugin
This plugin allows you to add, delete, and replace surrounding characters like parentheses, brackets, quotes, and HTML tags.

**Basic Usage:**
- `ys{motion}{character}` - Add surrounding character around text
  - Example: `ysiw)` adds parentheses around the word under the cursor
  - Example: `ysiw"` adds quotes around the word under the cursor

- `cs{old}{new}` - Change surrounding character
  - Example: `cs"'` changes quotes to apostrophes
  - Example: `cs)]` changes parentheses to brackets

- `ds{character}` - Delete surrounding character
  - Example: `ds"` removes quotes around text

- `yss{character}` - Add surrounding to entire line
  - Example: `yss)` adds parentheses around the entire line

**Custom HTML Tag Usage:**
- `ys{motion}t` - Add custom HTML tag around text
  - Example: `ysiwt` will prompt for a tag name and wrap the word in that tag
  - The tag name will be remembered for future use

**Visual Mode Usage:**
- Select text in visual mode, then press `S{character}` to surround
  - Example: Select text with `v`, then press `S)` to wrap in parentheses

#### mini.surround - Alternative Surround Plugin
This is an alternative to nvim-surround with a different keymap structure using the `<leader>m` prefix:

- `<leader>+msa` - Add surround in normal mode
- `<leader>+msa` (in visual mode) - Add surround around selected text
- `<leader>+msd` - Delete surround
- `<leader>+msr` - Replace surround
- `<leader>+msf` - Find surround

#### Comment Plugin - Code Commenting
This plugin allows you to quickly comment and uncomment code.

**Basic Usage:**
- `<leader>/` (normal mode) - Toggle comment on current line
- `<leader>/` (visual mode) - Toggle comment on selected text
- `<leader>bc` - Toggle block comment (for current line)
- `<leader>c` (visual mode) - Toggle block comment on selection

#### nvim-ufo - Advanced Folding
This plugin provides enhanced code folding capabilities.

**Basic Usage:**
- `zR` - Open all folds
- `zM` - Close all folds
- `zr` - Increase fold level (open more folds)
- `zm` - Decrease fold level (close more folds)
- `za` - Toggle fold under cursor
- `zc` - Close fold under cursor
- `zo` - Open fold under cursor
- `zA` - Enable UFO folding
- `zD` - Disable UFO folding

#### Telescope - Fuzzy Finder
This plugin provides powerful fuzzy finding capabilities.

**Basic Usage:**
- `<leader><leader>` - Find files
- `<leader>fg` - Live grep (search text in files)
- `<leader>fb` - Find buffers
- `<leader>fh` - Find help tags
- `<leader>ft` or `<leader>st` - Find todo comments
- `<leader>te` - File browser

#### Gitsigns - Git Integration
This plugin shows Git information directly in the editor.

**Basic Usage:**
- `<leader>gg` - Git status
- `<leader>gc` - Git commit
- `<leader>gp` - Git push
- `<leader>gl` - Git log
- `<leader>gfb` - Git branch
- `<leader>gfd` - Git diff
- `<leader>gfr` - Git rename
- `<leader>gfR` - Git reset HEAD
- `<leader>gfs` - Git stash
- `<leader>gfa` - Git add all
- `<leader>gfu` - Git undo changes to file
- `<leader>gfw` - Git browse file/URL
- `<leader>gfi` - Git init

**Hunk Navigation:**
- `<leader>gj` - Next git hunk
- `<leader>gk` - Previous git hunk
- `<leader>gp` - Preview git hunk
- `<leader>gr` - Reset git hunk
- `<leader>gs` - Stage git hunk
- `<leader>gu` - Undo stage git hunk

#### Visual-Multi - Multi-Cursor Editing
This plugin enables VS Code-style multi-cursor editing.

**Basic Usage:**
- `Alt+d` - Select next occurrence of current word
- `Ctrl+Down` - Add cursor below
- `Ctrl+Up` - Add cursor above
- `Alt+n` - Skip current selection
- `Alt+p` - Remove last cursor

#### Moveline - Moving Lines 
This plugin allows you to move lines up and down easily.

**Basic Usage:**
- `Alt+j` - Move line down (in normal mode)
- `Alt+k` - Move line up (in normal mode)
- `Alt+j` - Move selected lines down (in visual mode)
- `Alt+k` - Move selected lines up (in visual mode)
- `Alt+Shift+j` - Duplicate line down
- `Alt+Shift+k` - Duplicate line up

#### Floaterm - Floating Terminal
This plugin provides a floating terminal experience.

**Basic Usage:**
- `Ctrl+p` - Toggle floating terminal
- `Ctrl+j` - Cycle to previous terminal
- `Ctrl+k` - Cycle to next terminal

#### NvimTree - File Explorer
This plugin provides a tree-style file explorer.

**Basic Usage:**
- `<leader>e` - Toggle file explorer
- `l` - Open file/directory or navigate to next sibling
- `h` - Close folder or navigate to previous sibling

#### inc-rename.nvim - Incremental Rename
This plugin provides real-time incremental renaming of symbols with live preview.

**Basic Usage:**
- `<leader>rn` - Start incremental rename for symbol under cursor
- Type the new name and see changes applied in real-time across all occurrences
- Press Enter to confirm the rename or Esc to cancel

**Features:**
- Real-time preview of changes as you type
- Works with any LSP-supported language
- Shows all occurrences affected by the rename operation

#### tiny-inline-diagnostic.nvim - Inline Diagnostics
This plugin displays diagnostic information (errors, warnings, hints) inline on the right side of the code.

**Basic Usage:**
- Diagnostics appear automatically as you type
- Error/warning messages are displayed inline with your code
- Different colors and icons for error levels (red for errors, yellow for warnings, etc.)

#### Diagnostic Navigation
Built-in Neovim diagnostic functions are enhanced with custom keymaps for easy navigation.

**Key Bindings:**
- `]d` - Jump to next diagnostic
- `[d` - Jump to previous diagnostic
- `<leader>de` - Show diagnostic details in floating window
- `<leader>dq` - Open diagnostics in location list

**Features:**
- Navigate between errors and warnings quickly
- View detailed diagnostic information
- Rounded borders for floating diagnostic windows

---

*Crafted with passion for developers who demand excellence in their coding environment.*