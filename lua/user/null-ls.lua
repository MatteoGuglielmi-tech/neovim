vim.filetype.add {
  extension = {
    gitcommit = "gitcommit",
    zsh = "zsh",
  },
}

local M = {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    {
      "nvimtools/none-ls.nvim",
      dependencies = {
        "gbprod/none-ls-shellcheck.nvim",
      },
    },

  },
}

M.tools = {
  -- Formatters
  "autoflake",
  "black",
  "isort",
  "shfmt",
  "stylua",
  "cbfmt",
  -- linters
  -- "pydocstyle",
  -- "gitlint",
  "commitlint",
  -- dap
  "debugpy",
  -- code actions
}

function M.config()
  require("mason-null-ls").setup {
    ensure_installed = M.tools,
    automatic_installation = true,
  }

  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  -- local code_actions = null_ls.builtins.code_actions
  local completion = null_ls.builtins.completion

  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  null_ls.setup {
    sources = {
      -- formatters
      -- LUA
      formatting.stylua.with { filetypes = { "lua" } },

      -- MARKDOWN
      formatting.cbfmt.with { filetypes = { "markdown" } },

      -- PYTHON
      formatting.black.with {
        filetypes = { "python" },
        args = { "--quiet", "-", "--fast", "--line-length=80" },
      },
      formatting.isort.with {
        filetypes = { "python" },
        command = { "isort" },
        args = { "--stdout", "--filename", "$FILENAME", "-" }
      },

      -- SHELL
      formatting.shfmt.with { filetypes = { "sh" } },

      require("none-ls-shellcheck.diagnostics").with {
        filetypes = { "sh" },
      },

      require("none-ls-shellcheck.code_actions").with {
        command = "shellcheck",
        filetypes = { "sh" },
        args = { "--format", "json1", "--source-path=$DIRNAME", "--external-sources", "-" },
      },

      -- GITCOMMIT
      -- diagnostics.gitlint.with {
      --   { filetypes = { "gitcommit" }, args = { "--msg-filename", "$FILENAME" } },
      -- },
      diagnostics.commitlint.with {
        { filetypes = { "gitcommit" }, args = { "--format", "commitlint-format-json" } },
      },

      -- COMPLETION
      completion.spell.with {
        filetypes = { "markdown", "gitcommit", "text", "tex", "latex" },
        extra_args = { "--camel-case" },
      },

    },
    -- configure format on save
    on_attach = function(client, bufnr)
      if client.supports_method "textDocument/formatting" then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ timeout_ms = 1000000 })
            vim.lsp.buf.format {
              async = false,

              bufnr = bufnr,
              filter = function(client)
                --  only use null-ls for formatting instead of lsp server
                return client.name == "null-ls"
              end
            }
          end,
        })
      end
    end,
  }
end

return M
