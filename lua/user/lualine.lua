local M = {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
}

function M.config()
  -- harpoon integrations
  local harpoon = require("harpoon.mark")
  local function harpoon_component()
    local total_marks = harpoon.get_length()

    if total_marks == 0 then
      return ""
    end

    local current_mark = "—"

    local mark_idx = harpoon.get_current_index()
    if mark_idx ~= nil then
      current_mark = tostring(mark_idx)
    end

    return string.format("󱡅 %s/%d", current_mark, total_marks)
  end
  -----------------------

  local sl_hl = vim.api.nvim_get_hl_by_name("StatusLine", true)
  vim.api.nvim_set_hl(0, "Copilot", { fg = "#6CC644", bg = sl_hl.background })
  local icons = require "user.icons"
  local diff = {
    "diff",
    colored = true,
    symbols = { added = icons.git.LineAdded, modified = icons.git.LineModified, removed = icons.git.LineRemoved }, -- Changes the symbols used by the diff.
  }

  local copilot = function()
    local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }
    if #buf_clients == 0 then
      return "LSP Inactive"
    end

    local buf_client_names = {}
    local copilot_active = false

    for _, client in pairs(buf_clients) do
      if client.name ~= "null-ls" and client.name ~= "copilot" then
        table.insert(buf_client_names, client.name)
      end

      if client.name == "copilot" then
        copilot_active = true
      end
    end

    if copilot_active then
      return "%#Copilot#" .. icons.git.Octoface .. "%*"
    end
    return ""
  end

  require("lualine").setup {
    options = {
      -- section_separators = { left = "", right = "" },
      globalstatus = true,
      component_separators = { left = "", right = "" },
      -- component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },

      -- theme = 'tokyonight',
      theme = "catpuccin",

      ignore_focus = { "NvimTree" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        { "branch", icon = "" },
        harpoon_component,
        "diff",
        "diagnostics",
      },
      lualine_c = {
        { "filename", path = 1 },
      },

      lualine_x = { "encoding", copilot },
      lualine_y = { "filetype" },
      lualine_z = { "progress" },
    },
    extensions = { "quickfix", "man", "fugitive" },
  }
end

return M
