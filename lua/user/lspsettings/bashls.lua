return {
  single_file_support = true,
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh", "zsh" },
  -- root_dir = require("lspconfig.util").root_pattern(".git", vim.fn.getcwd()),
  settings = {
    bash = {
      format = {
        enable = true,
      },
    },
  },
}
