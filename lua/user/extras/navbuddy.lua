local M = {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
}

function M.config()
  local navbuddy = require("nvim-navbuddy")
  local actions = require("nvim-navbuddy.actions")

  navbuddy.setup {
    window = {
      border = "rounded", -- "single", "double", "solid", "none"
    },

    icons = require("user.icons").kind,

    use_default_mappings = false,
    mappings = {

      ["q"] = actions.close(),

      ["j"] = actions.next_sibling(),     -- down
      ["k"] = actions.previous_sibling(), -- up

      ["h"] = actions.parent(),           -- Move to left panel
      ["l"] = actions.children(),         -- Move to right panel
      ["0"] = actions.root(),             -- Move to first panel

      ["v"] = actions.visual_name(),      -- Visual selection of name
      ["V"] = actions.visual_scope(),     -- Visual selection of scope

      ["y"] = actions.yank_name(),        -- Yank the name to system clipboard "+
      ["Y"] = actions.yank_scope(),       -- Yank the scope to system clipboard "+

      ["i"] = actions.insert_name(),      -- Insert at start of name
      ["I"] = actions.insert_scope(),     -- Insert at start of scope

      ["a"] = actions.append_name(),      -- Insert at end of name
      ["A"] = actions.append_scope(),     -- Insert at end of scope

      ["r"] = actions.rename(),           -- Rename currently focused symbol

      ["d"] = actions.delete(),           -- Delete scope

      ["f"] = actions.fold_create(),      -- Create fold of current scope
      ["F"] = actions.fold_delete(),      -- Delete fold of current scope

      ["c"] = actions.comment(),          -- Comment out current scope

      ["<enter>"] = actions.select(),     -- Goto selected symbol

      ["J"] = actions.move_down(),        -- Move focused node down
      ["K"] = actions.move_up(),          -- Move focused node up

      ["s"] = actions.toggle_preview(),   -- Show preview of current node

      ["t"] = actions.telescope({         -- Fuzzy finder at current level.
        layout_config = {                 -- All options that can be
          height = 0.60,                  -- passed to telescope.nvim's
          width = 0.60,                   -- default can be passed here.
          prompt_position = "top",
          preview_width = 0.50
        },
        layout_strategy = "horizontal"
      }),

      ["g?"] = actions.help(), -- Open mappings help window
    },
    lsp = {
      auto_attach = true, -- If set to true, you don't need to manually use attach function
    },
    source_buffer = {
      follow_node = true, -- Keep the current node in focus on the source buffer
      highlight = true,   -- Highlight the currently focused node
      reorient = "smart", -- "smart", "top", "mid" or "none"
      scrolloff = nil     -- scrolloff value when navbuddy is open
    }
  }

  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_set_keymap
  keymap("n", "<m-o>", ":silent only | Navbuddy<cr>", opts)
end

return M
