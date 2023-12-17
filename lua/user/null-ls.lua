vim.filetype.add {
  extension = {
    gitcommit = "gitcommit",
    zsh = "zsh",
  },
}


local M = {
  "jose-elias-alvarez/null-ls.nvim",
}

function M.config()
  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local code_actions = null_ls.builtins.code_actions
  local completion = null_ls.builtins.completion

  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  null_ls.setup {
    sources = {
      -- formatters
      -- LUA
      formatting.stylua.with { filetypes = { "lua" } },
      -- MARKDOWN
      formatting.prettier.with {
        filetypes = { "css", "markdown", "html", "toml" }
        -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      },
      formatting.cbfmt.with { filetypes = { "markdown" } },
      -- PYTHON
      formatting.black.with {
        filetypes = { "python" },
        args = { "--quiet", "-", "--fast", "--line-length=80" },
      },

      formatting.reorder_python_imports.with {
        filetypes = { "python" },
      },

      -- SHELL
      formatting.shfmt.with { filetypes = { "sh", "zsh" } },

      -- diagnostics
      --  PYTHON
      diagnostics.pydocstyle.with {
        filetypes = { "python" },
        args = { "$FILENAME" },
      },

      diagnostics.shellcheck.with {
        filetypes = { "sh", "zsh" },
      },

      -- GITCOMMIT
      diagnostics.gitlint.with {
        { filetypes = { "gitcommit" }, args = { "--msg-filename", "$FILENAME" } },
      },

      -- actions
      code_actions.shellcheck.with {
        command = "shellcheck",
        filetypes = { "sh", "zsh" },
        argss = { "--format", "json1", "--source-path=$DIRNAME", "--external-sources", "-" },
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
            -- NOTE: shouldn't be necessary to filter here since filetypes are defines for all lsps to attch to.
            -- vim.lsp.buf.format {
            --   async = false,
            --
            --   bufnr = bufnr,
            --   filter = function(client)
            --     --  only use null-ls for formatting instead of lsp server
            --     return client.name == "null-ls"
            --   end
            -- }
          end,
        })
      end
    end,
  }
end

return M
