# Neovim IDE: Professional Development Environment

*A modern, powerful, and extensible Neovim configuration designed for full-stack developers. This configuration transforms Neovim into a professional IDE with cutting-edge features, AI assistance, and seamless workflows.*

---

## 🌟 Overview

This is a **comprehensive Neovim IDE configuration** crafted for modern full-stack development. It provides an elegant, professional environment with intelligent code completion, AI-powered assistance, advanced debugging tools, and seamless integration with popular frameworks and languages.

Whether you're building React applications, developing Node.js services, working with Laravel backends, or managing databases with Prisma, this configuration offers everything needed for productive development.

---

## 🚀 Key Features

### 🔧 Development Excellence
- **AI-Powered Coding Assistant**: Supermaven AI for intelligent code suggestions
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
- **Supermaven AI** - Real-time AI code completion and suggestions
- **FkNotes** - Personal note-taking system with Obsidian integration
- **Nvim-Gemini-Companion** - Qwen AI models integration for code assistance
- **Opencode.nvim** - Collaborative code sharing and review platform

### 🖱️ Multi-Cursor & Editing
- **vim-visual-multi** - VS Code-style multi-cursor editing with intuitive shortcuts

### 🧠 Language Intelligence
- **nvim-lspconfig** - Language server protocol integration
- **nvim-cmp** - Advanced completion engine with fuzzy matching
- **Treesitter** - Precise syntax parsing and highlighting
- **Typescript.nvim** - Enhanced TypeScript/JavaScript support
- **PHPactor** - PHP language intelligence
- **Prisma.nvim** - Prisma schema syntax highlighting

### 🎯 Navigation & Search
- **Telescope** - Fuzzy finder for files, buffers, and code
- **NvimTree** - File explorer with Git integration
- **Which-Key** - Interactive key binding guide
- **Hop.nvim** - Efficient character navigation
- **Flash.nvim** - Lightning-fast motion system

### 🛠️ Development Tools
- **Trouble** - Pretty diagnostics list and quick fixes
- **Neogen** - Documentation generation
- **Comment** - Smart code commenting
- **Surround** - Text object manipulation
- **AutoPairs** - Automatic bracket and quote pairing
- **Autotag** - HTML/XML tag auto-closing

### 🎨 UI Enhancements
- **Bufferline** - Enhanced tab and buffer management
- **Lualine** - Beautiful status line
- **Indent Blankline** - Visual indentation guides
- **Colorizer** - Color code highlighting
- **Noice** - Improved notifications and UI elements
- **Notify** - Elegant notification system
- **Twilight** - Focus mode for reduced distractions

### 🌐 Web Development
- **Tailwind Tools** - Tailwind CSS utilities and colorizer
- **Volar** - Vue.js development support
- **Emmet** - HTML/CSS abbreviation expansion
- **Live Server** - Local development server integration

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

### 🎯 Specialized Functionality
- **Mini.nvim** - Collection of minimal utility plugins
- **Snacks.nvim** - Essential productivity enhancements
- **UFO** - Advanced code folding
- **Rainbow** - Nested parentheses colorization
- **Context** - Context-aware code display

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
| `Alt+l` | Accept AI Suggestion | Accept Supermaven AI completion |
| `Alt+c` | Clear AI Suggestion | Clear current AI suggestion |
| `Alt+w` | Accept AI Word | Accept single word from AI suggestion |

### 🔍 Navigation & Search
| Shortcut | Function | Description |
|----------|----------|-------------|
| `Space Space` | Find Files | Search files with fuzzy finder |
| `Space fg` | Live Grep | Search text across project |
| `Space fb` | Find Buffers | Switch between open buffers |
| `Space te` | File Browser | Browse files in tree view |

### 📁 File Operations
| Shortcut | Function | Description |
|----------|----------|-------------|
| `Space e` | Toggle Explorer | Show/hide file explorer |
| `Space tn` | New Tab | Create new tab |
| `Space tc` | Close Tab | Close current tab |

### 💻 Development
| Shortcut | Function | Description |
|----------|----------|-------------|
| `Space fm` | Format Code | Auto-format current file |
| `Space ca` | Code Action | Trigger code action menu |
| `Space cc` | Toggle Comment | Comment/uncomment selected lines |
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
- **Supermaven AI** integration for real-time code suggestions
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

*Crafted with passion for developers who demand excellence in their coding environment.*