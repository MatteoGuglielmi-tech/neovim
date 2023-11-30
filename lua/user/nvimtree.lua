local M = {
  "nvim-tree/nvim-tree.lua",
  event = "VeryLazy",
  dependencies = {
    "JMarkin/nvim-tree.lua-float-preview",
    lazy = true,
    -- default
    opts = {
      -- wrap nvimtree commands
      wrap_nvimtree_commands = true,
      -- lines for scroll
      scroll_lines = 20,
      -- window config
      window = {
        style = "minimal",
        relative = "win",
        border = "rounded",
        wrap = false,
      },
      mapping = {
        -- scroll down float buffer
        down = { "<C-d>" },
        -- scroll up float buffer
        up = { "<C-u>" },
        -- enable/disable float windows
        toggle = { "<C-t>" },
      },
      -- hooks if return false preview doesn't shown
      hooks = {
        pre_open = function(path)
          -- if file > 5 MB or not text -> not preview
          local size = require("float-preview.utils").get_size(path)
          if type(size) ~= "number" then
            return false
          end
          local is_text = require("float-preview.utils").is_text(path)
          return size < 5 and is_text
        end,
        post_open = function(bufnr)
          return true
        end,
      },
    },
  },
}

function M.config()
  local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"
    local FloatPreview = require "float-preview"

    FloatPreview.attach_nvimtree(bufnr)
    -- local close_wrap = FloatPreview.close_wrap
    -- vim.keymap.set("n", "<Tab>", close_wrap(api.node.open.preview), opts "Open preview")
    -- vim.keymap.set("n", "<CR>", close_wrap(api.node.open.edit), opts "Open")

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set("n", "l", api.node.open.edit, opts "Open")
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts "Close Directory")
    vim.keymap.set("n", "v", api.node.open.vertical, opts "Open: Vertical Split")
    vim.keymap.del("n", "<C-k>", { buffer = bufnr })
    vim.keymap.set("n", "<S-k>", api.node.open.preview, opts "Open Preview")
  end

  local icons = require "user.icons"

  require("nvim-tree").setup {
    on_attach = my_on_attach,
    hijack_netrw = false,
    sync_root_with_cwd = true,
    view = {
      relativenumber = true,
    },
    renderer = {
      add_trailing = false,
      group_empty = false,
      highlight_git = false,
      full_name = false,
      highlight_opened_files = "none",
      root_folder_label = ":t",
      indent_width = 2,
      indent_markers = {
        enable = false,
        inline_arrows = true,
        icons = {
          corner = "└",
          edge = "│",
          item = "│",
          none = " ",
        },
      },
      icons = {
        git_placement = "before",
        padding = " ",
        symlink_arrow = " ➛ ",
        glyphs = {
          default = icons.ui.Text,
          symlink = icons.ui.FileSymlink,
          bookmark = icons.ui.BookMark,
          folder = {
            arrow_closed = icons.ui.ChevronRight,
            arrow_open = icons.ui.ChevronShortDown,
            default = icons.ui.Folder,
            open = icons.ui.FolderOpen,
            empty = icons.ui.EmptyFolder,
            empty_open = icons.ui.EmptyFolderOpen,
            symlink = icons.ui.FolderSymlink,
            symlink_open = icons.ui.FolderOpen,
          },
          git = {
            unstaged = icons.git.FileUnstaged,
            staged = icons.git.FileStaged,
            unmerged = icons.git.FileUnmerged,
            renamed = icons.git.FileRenamed,
            untracked = icons.git.FileUntracked,
            deleted = icons.git.FileDeleted,
            ignored = icons.git.FileIgnored,
          },
        },
      },
      special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
      symlink_destination = true,
    },
    update_focused_file = {
      enable = true,
      debounce_delay = 15,
      update_root = true,
      ignore_list = {},
    },

    diagnostics = {
      enable = true,
      show_on_dirs = false,
      show_on_open_dirs = true,
      debounce_delay = 50,
      severity = {
        min = vim.diagnostic.severity.HINT,
        max = vim.diagnostic.severity.ERROR,
      },
      icons = {
        hint = icons.diagnostics.BoldHint,
        info = icons.diagnostics.BoldInformation,
        warning = icons.diagnostics.BoldWarning,
        error = icons.diagnostics.BoldError,
      },
    },
  }
end

return M
