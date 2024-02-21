local M = {
  "luukvbaal/statuscol.nvim",
  branch = "0.10"
}

function M.config()
  require("statuscol").setup()
end

return M
