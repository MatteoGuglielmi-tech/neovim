local M = {
  "zbirenbaum/copilot-cmp",
  dependencies = {
    {
      "zbirenbaum/copilot.lua",
      event = { "BufEnter" },
      config = function()
        -- form source : https://github.com/zbirenbaum/copilot-cmp
        require("copilot").setup({
          suggestion = { enabled = false },
          panel = { enabled = false },
        })
      end
    }
  },

  config = function()
    require("copilot_cmp").setup()
  end
}

return M
