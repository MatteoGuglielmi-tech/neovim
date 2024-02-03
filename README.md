## 📖 Table of Contents 📖

<!--toc:start-->

- [🎨 Author 🎨](#🎨-author-🎨)
- [❓ What are we talking about? ❓](#what-are-we-talking-about)
- [👾 Programming languages 👾](#👾-programming-languages-👾)
- [📌 Dependencies 📌](#📌-dependencies-📌)
- [🔌 Plugins 🔌](#🔌-plugins-🔌)
- [⬇️ Installation ⬇️](#️-installation-️)
- [⚠️ Notes ⚠️](#️-notes-️)
<!--toc:end-->

## 🎨 Author 🎨

Author/Owner : Guglielmi Matteo [@GitHub](https://github.com/MatteoGuglielmi-tech)

## ❓ What are we talking about? ❓

This repository contains a <u>personal configuration</u> for NeoVim inspired by [this repo](https://github.com/ChristianChiarulli/nvim) from [@ChristianChiarulli](https://github.com/ChristianChiarulli).

## 👾 Programming languages 👾

The configuration is designed to work with the following programming languages:

- Bash
- Lua
- Python
- LaTeX
- Rust 
- Typescript 

and the following markup language:

- Markdown

It is of course possible to extend the configuration to other languages by :

1. adding the LSP name to the `ensure_installed` entry in `user/mason.lua`
2. adding the corresponding configuration in `extras/lspsettings/` by creating a new lua file named as the server to configure.

Additionally, in the `extras/ftplugin/` folder, it is possible to specify local mappings and language exclusive settings by creating a lua file named as the target programming language.

## 📌 Dependencies 📌

Before moving forward, it is necessary to install the following dependencies for the configuration to work properly:

- [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- [Node.js](https://nodejs.org/en/download/)
- pynvim
- ripgrep
- [nerd-fonts](https://github.com/ronniedroid/getnf)

For copy/paste support in the system clipboard, it is necessary to install `wl-clipboard` (wayland) or `xsel` (X11) depending on your distribution.  
On MacOS, it is necessary to install `pbcopy` (it should be present in the system by default).

## 🔌 Plugins 🔌

The configuration uses [LazyVim](https://github.com/LazyVim/LazyVim) to load each plugin only when a trigger event takes place. The base configuration can be found at [Launch.nvim](https://github.com/LunarVim/Launch.nvim).
The main plugins used are:

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax highlighting
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) for a file explorer
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) for fancy icons
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) for autocompletion
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) for auto pairs
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) for fuzzy finding, file browsing and live grep
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig), [mason.nvim](https://github.com/williamboman/mason.nvim), [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim), [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) and [mason-null-ls.nvim](https://github.com/jay-babu/mason-null-ls.nvim) for LSP, DAP, Formatting and Linting
- [trouble.nvim](https://github.com/folke/trouble.nvim) for a better display of LSP diagnostics, references, quick fix list, etc.
- [vim-fugitive](https://github.com/tpope/vim-fugitive) and [neogit](https://github.com/NeogitOrg/neogit) for an amazing git integration
- [vim-surround](https://github.com/tpope/vim-surround) for blazingly fast surrounding shortcuts
- [harpoon](https://github.com/ThePrimeagen/harpoon) for a better navigation between buffers
- [nvim-comment](https://github.com/numToStr/Comment.nvim) for commenting shortcuts
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) for enhancement of TODOs, FIXMEs, etc.
- [which-key.nvim](https://github.com/folke/which-key.nvim) for keybindings help

and many more.

## ⬇️ Installation ⬇️

To install and use this configuration, follow the steps below:

```Bash
# Clone the repository's content
git clone --recursive --depth=1 https://github.com/MatteoGuglielmi-tech/neovim.git ~/.config/nvim
cd ~/.config/nvim && nvim
```

At this point, let LazyVim install the plugins and exit Neovim. Once this is done, reopen Neovim and you should be good to go.

## ⚠️ Notes ⚠️

Feel free to copy and modify this configuration to your liking.  
This setup has been <u>tested on Linux and MacOS</u>, nothing is ensured on Windows.
