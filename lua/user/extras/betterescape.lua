local M = {
    "max397574/better-escape.nvim",
    event = "BufEnter",
}

function M.config()
      require("better_escape").setup {
        mapping = { "jk" },
        timeout = vim.o.timeoutlen,
        clear_empty_lines = false,
        keys = "<Esc>",
      }
end

return M
