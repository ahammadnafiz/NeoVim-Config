<h1 align="center">🚀 Enhanced Neovim Configuration</h1>

<p align="center">
  <a href="https://neovim.io/"><img src="https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white" alt="Neovim"></a>
  <a href="https://www.lua.org/"><img src="https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white" alt="Lua"></a>
  <a href="https://www.python.org/"><img src="https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54" alt="Python"></a>
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License: Apache 2.0"></a>
</p>

<p align="center">A powerful, feature-rich Neovim configuration optimized for Python development and general productivity.</p>

---

## ✨ Features

- 🐍 **Python Optimization**: First-class support for Python development
- 🧠 **Intelligent Completion**: Powered by CoC (Conquer of Completion)
- 🌳 **File Management**: Intuitive file exploration with NERDTree
- 🔎 **Fuzzy Finding**: Quick file and text search via Telescope and FZF
- 🔧 **Git Integration**: Seamless version control with Fugitive and Gitsigns
- 🎨 **Syntax Highlighting**: Beautiful and accurate code highlighting
- ⚡ **Performance**: Lightning-fast startup with Impatient.nvim
- 📊 **Status Line**: Informative and customizable with Lualine
- 🔢 **Code Structure**: Easy code navigation with Tagbar

## 🛠️ Prerequisites

| Requirement | Version |
|-------------|---------|
| Neovim      | >= 0.5.0|
| Git         | Latest  |
| Node.js     | Latest LTS |
| Python      | 3.x     |
| C Compiler  | Any (MinGW for Windows) |

## 📦 Installation

1. **Backup** your existing configuration:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone** this repository:
   ```bash
   git clone https://github.com/ahammadnafiz/NeoVim-Config.git
   ```

3. **Install** vim-plug:
   ```bash
   sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
   ```

4. **Open** Neovim and install plugins:
   ```
   :PlugInstall
   ```

5. **Install** language servers and CoC extensions as needed.

## ⚙️ Configuration Highlights

| Component | Description |
|-----------|-------------|
| `init.vim`| Main configuration file |
| Plugins   | Managed by vim-plug |
| Mappings  | Intuitive key bindings |
| Themes    | Moonfly colorscheme |

## 🎨 Customization

Feel free to tailor the configuration to your workflow:

- Adjust the color scheme
- Modify key mappings
- Enable/disable plugins
- Fine-tune language-specific settings

## 🤝 Contributing

We welcome contributions! Here's how you can help:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="center">Elevate your Neovim experience to new heights! ✨</p>
