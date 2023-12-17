local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  local mappings = {
    ["q"] = { "<cmd>confirm q<CR>", "Quit" },
    ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment" },
    ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    ["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
    ["o"] = { "<cmd>Navbuddy<cr>", "Nav" },
    b = {
      name = "Buffers",
      -- j = { "<cmd>BufferLinePick<cr>", "Jump" },
      b = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
      -- b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
      -- n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
      e = {
        "<cmd>BufferLinePickClose<cr>",
        "Pick which buffer to close",
      },
      D = {
        "<cmd>BufferLineSortByDirectory<cr>",
        "Sort by directory",
      },
      L = {
        "<cmd>BufferLineSortByExtension<cr>",
        "Sort by language",
      },
    },
    d = {
      name = "Debug",
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
      b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
      d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
      g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
      u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
      p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
      r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
      s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
      q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
      U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
    },
    p = {
      name = "Plugins",
      i = { "<cmd>Lazy install<cr>", "Install" },
      s = { "<cmd>Lazy sync<cr>", "Sync" },
      S = { "<cmd>Lazy clear<cr>", "Status" },
      c = { "<cmd>Lazy clean<cr>", "Clean" },
      u = { "<cmd>Lazy update<cr>", "Update" },
      p = { "<cmd>Lazy profile<cr>", "Profile" },
      l = { "<cmd>Lazy log<cr>", "Log" },
      d = { "<cmd>Lazy debug<cr>", "Debug" },
    },

    -- n = {
    --   name = "Nostr",
    --   k = { '<cmd>lua require("nostr").generate_keys()<cr>', "Generate Keys" },
    --   a = { '<cmd>lua require("nostr").add_relay()<cr>', "Add Relay" },
    --   r = { '<cmd>lua require("nostr").remove_relay()<cr>', "Remove Relay" },
    --   l = { '<cmd>lua require("nostr").list_relays()<cr>', "List Relays" },
    --   s = { '<cmd>lua require("nostr").set_active_relay()<cr>', "Set Active Relay" },
    --   S = { '<cmd>lua require("nostr").publish_snippet()<cr>', "Publish Snippet" },
    --   n = { '<cmd>lua require("nostr").publish_note()<cr>', "Publish Note" },
    --   d = { '<cmd>lua require("nostr").decode()<cr>', "Decode" },
    --   e = { '<cmd>lua require("nostr").encode()<cr>', "Encode" },
    --   b = { '<cmd>lua require("nostr").publish_blog()<cr>', "Publish Blog" },
    --   B = { '<cmd>lua require("nostr").publish_bounty()<cr>', "Publish Bounty" },
    -- },

    -- j = {
    --   name = "JavaScript",
    --   s = { '<cmd>lua require("package-info").show()<cr>', "Show package info" },
    --   h = { '<cmd>lua require("package-info").hide()<cr>', "Hide package info" },
    --   t = { '<cmd>lua require("package-info").toggle()<cr>', "Toggle package info" },
    --   u = { '<cmd>lua require("package-info").update()<cr>', "Update package" },
    --   d = { '<cmd>lua require("package-info").delete()<cr>', "Delete package" },
    --   i = { '<cmd>lua require("package-info").install()<cr>', "Install package" },
    --   v = { '<cmd>lua require("package-info").change_version()<cr>', "Change Version" },
    -- },

    f = {
      name = "Find",
      -- b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
      f = { "<cmd>Telescope find_files<cr>", "Find files" },
      -- p = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
      t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
      s = { "<cmd>Telescope grep_string<cr>", "Find String" },
      h = { "<cmd>Telescope help_tags<cr>", "Help" },
      H = { "<cmd>Telescope highlights<cr>", "Highlights" },
      -- i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
      l = { "<cmd>Telescope resume<cr>", "Last Search" },
      M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
      r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
      R = { "<cmd>Telescope registers<cr>", "Registers" },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      C = { "<cmd>Telescope commands<cr>", "Commands" },
    },

    g = {
      name = "Git",

      -- NeoGit mappings for insspecting commits and diffs
      g = { "<cmd>Neogit<cr>", "Lazygit" },
      -- Fugitive mappings for git interaction
      a = { ":Gwrite<CR>", "Git add" },
      c = { ":Git commit<CR>", "Git commit" },
      e = { ":GDelete<CR>", "Git delete" },
      p = { ":Git pull<CR>", "Git pull" },
      u = { ":Git push<CR>", "Git push" },
      s = { ":G<CR>", "Git status" },

      -- Gitsigns mappings for navigating hunks (blocks of changed lines)
      j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
      k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
      l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
      n = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
      r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
      R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
      S = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
      U = {
        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        "Undo Stage Hunk",
      },
      d = {
        "<cmd>Gitsigns diffthis HEAD<cr>",
        "Git Diff",
      },

      -- Telescope mappings for navigating git objects
      o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      h = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
      C = {
        "<cmd>Telescope git_bcommits<cr>",
        "Checkout commit(for current file)",
      },
    },
    l = {
      name = "LSP",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
      b = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      c = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
      d = { "<cmd>TroubleToggle document_diagnostics<CR>", "Document diagnostics" }, -- document diagnostics from the builtin LSP client
      D = { "<cmd>TroubleToggle lsp_definitions<CR>", "Lsp Definitions" },           -- definitions of the word under the cursor
      -- e = { "<cmd>Telescope quickfix<CR>", "Telescope Quickfix" },
      -- f = { "<cmd>lua vim.lsp.buf.format({timeout_ms = 1000000})<cr>", "Manual format" },
      -- i = { "<cmd>Telescope lsp_implementations<CR>", "Show Implementation wuc" },   -- implementations of the word under the cursor
      I = { "<cmd>LspInfo<cr>", "Lsp Info" },
      l = { "<cmd>TroubleToggle lsp_type_definitions<CR>", "Lsp Type Definitions" }, -- type definitions of the word under the cursor
      M = { "<cmd>Mason<cr>", "Mason Info" },
      n = { "<cmd>ToggleRefresh<CR>", "Refresh loclist" },                           -- toggle auto loclist refresh
      q = { "<cmd>TodoTrouble<CR>", "Todo Quickfix" },
      r = { "<cmd>TroubleToggle lsp_references<CR>", "Lsp References" },             -- references of the word under the cursor
      R = { "<cmd>LspRestart<CR>", "LspRestart" },
      t = {
        '<cmd>lua require("user.functions").toggle_diagnostics()<cr>',
        "Toggle Diagnostics",
      },
      T = { "<cmd>TroubleToggle<CR>", "Open Trouble list" },
      v = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Toggle Virtual Text" },
      w = {
        "<cmd>TroubleToggle workspace_diagnostics<CR>",
        "Workspace disagnostics",
      }, -- workspace diagnosticns from the builtin LSP client
    },

    s = {
      name = "Splits",
      e = { "<C-w>=", "Make splitted windows the same dimensions" },
      h = { "<C-w>s", "Split horizontally" },
      v = { "<C-w>v", "Split vertically" },
    },

    t = {
      name = "Tab",
      t = {
        "<cmd>lua require('telescope').extensions['telescope-tabs'].list_tabs(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Tabs'})<cr>",
        "Find Tab",
      },
      a = { "<cmd>$tabnew<cr>", "New Empty Tab" },
      A = { "<cmd>tabnew %<cr>", "New Tab" },
      n = { "<cmd>tabn<cr>", "Next" },
      o = { "<cmd>tabonly<cr>", "Only" },
      p = { "<cmd>tabp<cr>", "Prev" },
      h = { "<cmd>-tabmove<cr>", "Move Left" },
      l = { "<cmd>+tabmove<cr>", "Move Right" },
    },

    T = {
      name = "Treesitter",
      i = { ":TSConfigInfo<cr>", "Info" },
    },

  }

  local opts = {
    mode = "n",     -- NORMAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
  }

  -- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
  -- see https://neovim.io/doc/user/map.html#:map-cmd
  local vmappings = {
    ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
    l = {
      name = "LSP",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    },
  }

  local vopts = {
    mode = "v",     -- VISUAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
  }

  local which_key = require "which-key"

  which_key.setup {
    plugins = {
      marks = false,     -- shows a list of your marks on ' and `
      registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = true,
        suggestions = 20,
      }, -- use which-key for spelling hints
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = false,    -- adds help for operators like d, y, ...
        motions = false,      -- adds help for motions
        text_objects = false, -- help for text objects triggered after entering an operator
        windows = false,      -- default bindings on <c-w>
        nav = false,          -- misc bindings to work with windows
        z = false,            -- bindings for folds, spelling and others prefixed with z
        g = false,            -- bindings for prefixed with g
      },
    },
    popup_mappings = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>",   -- binding to scroll up inside the popup
    },
    window = {
      border = "rounded",       -- none, single, double, shadow
      position = "bottom",      -- bottom, top
      margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0,
    },
    layout = {
      height = { min = 4, max = 25 },                                             -- min and max height of the columns
      width = { min = 20, max = 50 },                                             -- min and max width of the columns
      spacing = 3,                                                                -- spacing between columns
      align = "left",                                                             -- align columns left, center or right
    },
    ignore_missing = true,                                                        -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true,                                                             -- show help message on the command line when the popup is visible
    show_keys = true,                                                             -- show the currently pressed key and its label as a message in the command line
    triggers = "auto",                                                            -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
      -- list of mode / prefixes that should never be hooked by WhichKey
      -- this is mostly relevant for key maps that start with a native binding
      -- most people should not need to change this
      i = { "j", "k" },
      v = { "j", "k" },
    },
    -- disable the WhichKey popup for certain buf types and file types.
    -- Disabled by default for Telescope
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }

  which_key.register(mappings, opts)
  which_key.register(vmappings, vopts)

  local m_opts = {
    mode = "n",     -- NORMAL mode
    prefix = "m",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
  }

  local m_mappings = {
    m = { "<cmd>BookmarkToggle<cr>", "Toggle" },
    j = { "<cmd>BookmarkNext<cr>", "Next" },
    k = { "<cmd>BookmarkPrev<cr>", "Prev" },
    c = { "<cmd>BookmarkClear<cr>", "Clear" },
    l = { "<cmd>BookmarkList<cr>", "List" },
    -- f = { "<cmd>FilemarkToggle<cr>", "Mark File" },
    h = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon" },
    ["."] = { '<cmd>lua require("harpoon.ui").nav_next()<cr>', "Harpoon Next" },
    [","] = { '<cmd>lua require("harpoon.ui").nav_prev()<cr>', "Harpoon Prev" },
    -- l = { "<cmd>lua require('user.bfs').open()<cr>", "Buffers" },
    -- s = { "<cmd>Telescope harpoon marks<cr>", "Search Files" },
    -- s = {
    --   "<cmd>lua require('telescope').extensions.vim_bookmarks.all({ hide_filename=false, prompt_title=\"bookmarks\", shorten_path=false })<cr>",
    --   "Show",
    -- },
    -- [";"] = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon UI" },
  }

  which_key.register(m_mappings, m_opts)
end

return M
