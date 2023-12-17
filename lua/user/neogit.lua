local M = {
  "neogitorg/neogit",
  event = "VeryLazy",
}

function M.config()
  local icons = require "user.icons"

  require("neogit").setup {
    disable_signs = false,
    disable_hint = false,
    disable_context_highlighting = false,
    disable_commit_confirmation = true,
    disable_insert_on_commit = "auto",
    -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
    -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
    auto_refresh = true,
    disable_builtin_notifications = false,
    use_magit_keybindings = false,
    -- Change the default way of opening neogit
    kind = "tab",
    -- Change the default way of opening the commit popup
    commit_popup = {
      kind = "split",
    },
    -- Change the default way of opening popups
    popup = {
      kind = "split",
    },
    -- customize displayed signs
    signs = {
      -- { CLOSED, OPENED }
      section = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
      item = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
      hunk = { "", "" },
    },
    integrations = {
      diffview = true,
    },
    -- override/add mappings
    mappings = {
      --   -- modify status buffer mappings
      status = {
        -- NOTE:
        -- "{" : Goto previous hunk
        -- "}" : Goto next hunk
        ["<tab>"] = "Toggle",
        ["<enter>"] = "Toggle",
        ["a"] = "StageUnstaged",
        ["q"] = "Close",
        ["s"] = "Stage",
        ["S"] = "StageAll",
        ["u"] = "Unstage",
        ["U"] = "UnstageStaged",
        ["x"] = "Discard",
      },
      popup = {
        ["?"] = "HelpPopup",
        ["f"] = "FetchPopup",
        ["p"] = "PullPopup",
        ["P"] = "PushPopup",
        ["X"] = "FetchPopup",
        ["m"] = "MergePopup",
        ["v"] = "RevertPopup",
        ["M"] = "RemotePopup",
        ["r"] = "RebasePopup",
        ["c"] = "CommitPopup",
        ["Z"] = "StashPopup",
        ["b"] = "BranchPopup",
      },
    },
  }
end

return M
