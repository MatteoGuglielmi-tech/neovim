local M = {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "jose-elias-alvarez/null-ls.nvim",
  },
}

M.tools = {
  -- Formatters
  "autoflake",
  "black",
  "reorder-python-imports",
  "shfmt",
  "stylua",
  "cbfmt",
  -- linters
  "pydocstyle",
  "gitlint",
  "shellcheck",
  -- dap
  "debugpy",
  -- code actions
}

function M.config()
  require("mason-null-ls").setup {
    ensure_installed = M.tools,
    automatic_installation = true,
  }
end

return M
