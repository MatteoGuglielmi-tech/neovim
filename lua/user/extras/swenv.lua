-- local status_ok, which_key = pcall(require, "which-key")
-- if not status_ok then
--   return
-- end

local M = {
  'AckslD/swenv.nvim',
  event = "VeryLazy",
}

function M.config()
  require("swenv").setup {
    -- Should return a list of tables with a `name` and a `path` entry each.
    -- Gets the argument `venvs_path` set below.
    -- By default just lists the entries in `venvs_path`.
    get_venvs = function(venvs_path)
      return require("swenv.api").get_venvs(venvs_path)
    end,
    -- Path passed to `get_venvs`.
    venvs_path = vim.fn.expand "$HOME/.conda/envs",
    -- Something to do after setting an environment, for example call vim.cmd.LspRestart
    post_set_venv = function()
      vim.cmd [[LspRestart]]
    end,
  }
end

-- local mappings = {
--   C = {
--     name = "Python",
--     c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
--   },
-- }
--
-- local opts = {
--   mode = "n",     -- NORMAL mode
--   prefix = "<leader>",
--   buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true,  -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = true,  -- use `nowait` when creating keymaps
-- }
--
-- which_key.register(mappings, opts)

return M
