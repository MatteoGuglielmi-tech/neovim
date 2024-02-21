-- local M = {
--   "zbirenbaum/copilot-cmp",
--   dependencies = {
--     {
--       "zbirenbaum/copilot.lua",
--       event = { "BufEnter" },
--       config = function()
--         -- form source : https://github.com/zbirenbaum/copilot-cmp
--         require("copilot").setup({
--           suggestion = { enabled = false },
--           panel = { enabled = false },
--         })
--       end
--     }
--   },
--
--   config = function()
--     require("copilot_cmp").setup()
--   end
-- }
--
-- return M


local M = {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
}

function M.config()
  require("copilot").setup({
    panel = {
      enabled = true,
      auto_refresh = false,
      keymap = {
        jump_prev = "[[",
        jump_next = "]]",
        accept = "<CR>",
        refresh = "gr",
        -- open = "<M-CR>"
      },
      layout = {
        position = "bottom", -- | top | left | right
        ratio = 0.4
      },
    },
    suggestion = {
      enabled = true,
      auto_trigger = false,
      debounce = 75,
      keymap = {
        accept = "<C-y>",
        accept_word = false,
        accept_line = false,
        next = "<M-j>",
        prev = "<M-k>",
        dismiss = "q",
      },
    },
    filetypes = {
      help = false,
    },
    -- copilot_node_command = 'node', -- Node.js version must be > 18.x
    server_opts_overrides = {},
  })
end

return M
