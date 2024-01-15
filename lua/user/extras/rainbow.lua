local M = {
  "HiPhish/rainbow-delimiters.nvim",
}

function M.config()
  local rainbow_delimiters = require "rainbow-delimiters"

  vim.g.rainbow_delimiters = {
    strategy = {
      [""] = rainbow_delimiters.strategy["global"],
      vim = rainbow_delimiters.strategy["local"],
    },
    query = {
      [""] = "rainbow-delimiters",
      lua = "rainbow-parens",
    },
    highlight = {
      "TSRainbowRed",
      "TSRainbowBlue",
      "TSRainbowOrange",
      "TSRainbowYellow",
      "TSRainbowViolet",
      "TSRainbowGreen",
    },
  }
end

return M
