local M = {
  "nvim-tree/nvim-tree.lua",
  event = "VeryLazy",
  dependencies = {
    "JMarkin/nvim-tree.lua-float-preview",
    lazy = true,
    opts = {
      wrap_nvimtree_commands = true,
      scroll_lines = 20,
      window = {
        style = "minimal",
        relative = "win",
        border = "rounded",
        wrap = false,
      },
      mapping = {
        down = { "<C-d>" },
        up = { "<C-e>", "<C-u>" },
        toggle = { "<C-x>" },
      },
    }
  },
}


function M.config()
  local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"
    local FloatPreview = require "float-preview"


    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    FloatPreview.attach_nvimtree(bufnr)
    local close_wrap = FloatPreview.close_wrap

    vim.keymap.set("n", "<C-v>", close_wrap(api.node.open.vertical), opts("Open: Vertical Split"))
    vim.keymap.set("n", "<C-o>", close_wrap(api.node.open.horizontal), opts("Open: Horizontal Split"))
    vim.keymap.set("n", "l", close_wrap(api.node.open.edit), opts("Open"))
    vim.keymap.set("n", "c", close_wrap(api.node.navigate.parent_close), opts "Close Directory")
    vim.keymap.set("n", "<Tab>", close_wrap(api.node.open.preview), opts("Open: Preview in buffer"))
    vim.keymap.set("n", "a", close_wrap(api.fs.create), opts("Create"))
    vim.keymap.set("n", "d", close_wrap(api.fs.remove), opts("Delete"))
    vim.keymap.set("n", "r", close_wrap(api.fs.rename), opts("Rename"))
  end

  local icons = require "user.icons"

  require("nvim-tree").setup {
    on_attach = my_on_attach,
    disable_netrw = false,
    hijack_netrw = true, -- from nvimtree doc : It is strongly recommended to disable |netrw|
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
