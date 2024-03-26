require "user.launch"
require "user.options"
require "user.sudo"  -- to read or write files with sudo command 
require "user.keymaps"
require "user.autocmds"

-- spec "user.colorscheme"
spec "user.macchiato"
-- spec "user.tokyonight"
spec "user.devicons"
spec "user.treesitter"
spec "user.lspconfig"
-------------------------------
-- the following are cool to understand where shortcuts such as "gd" bring you
spec "user.navic"
spec "user.breadcrumbs"
-------------------------------
spec "user.cmp"
spec "user.null-ls"
spec "user.illuminate" -- highlight all instances of word under cursor
spec "user.telescope"
spec "user.nvimtree"
spec "user.lualine"
spec "user.whichkey"
spec "user.autopairs"
spec "user.comment"
spec "user.gitsigns"
spec "user.neogit"
spec "user.diffview"
spec "user.indentline"
spec "user.alpha"
spec "user.netrw" -- fancy file explorer icons
spec "user.toggleterm"
spec "user.bufdelete"
-- Extras
spec "user.extras.colorizer" -- translates hex colors to actual colors
spec "user.extras.smoothie"  -- for a smooth scrolling experience
spec "user.extras.betterescape"
spec "user.extras.copilot"
spec "user.extras.modicator" -- cursor line number indicator
spec "user.extras.rainbow"   -- rainbow parentheses powered by Treesitter
spec "user.extras.matchup"   -- enhanced % matching
spec "user.extras.dial"      -- enchanced increment/decrement capabilities
spec "user.extras.nui"       -- UI for NeoVim
spec "user.extras.dressing"  -- UI component
spec "user.extras.surround"  -- surround text shortcuts
spec "user.extras.navbuddy"
spec "user.extras.noice"     -- replaces UI components for msgs, cmdline and popumenus
spec "user.extras.lab"       -- interesting for debug
spec "user.extras.typescript-tools"
spec "user.extras.harpoon"
spec "user.extras.todocomments"
spec "user.extras.trouble"
spec "user.extras.swenv"
spec "user.extras.markdown-preview"
-- spec "user.extras.ufo"
spec "user.extras.statuscol"
require "user.lazy"
