-- reference : https://github.com/sindrets/diffview.nvim

local M = {
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
}

function M.config()
  require("diffview").setup {
    view = {
      -- default = {},
      merge_tool = {
        layout = "diff4_mixed",
        disable_diagnostics = true,
        winbar_info = true,
      }
    }
  }
end

return M
