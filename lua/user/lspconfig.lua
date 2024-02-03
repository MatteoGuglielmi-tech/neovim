local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
      {
        "kevinhwang91/nvim-ufo",
        event = "BufEnter",
        dependencies = {
          "kevinhwang91/promise-async",
        },
      }
    }
  }
}

M.ensure_installed = {
  "pyright",
  "lua_ls",
  "clangd",
  "rust_analyzer",
  "marksman",
  "bashls",
  "texlab",
  "vimls",
  "yamlls",
}

M.in_lspsettings_folder = {
  "bashls",
  "lua_ls",
  "pyright",
  "marksman",
  "tex_lab"
}

function M.common_capabilities()
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    -- add additional capabilities supported by nvim-cmp
    return cmp_nvim_lsp.default_capabilities()
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
  }

  return capabilities
end

function M.config()
  require("mason").setup({ ui = { border = "rounded", } })
  require("mason-lspconfig").setup({
    ensure_installed = M.ensure_installed,
  })
  local lspconfig = require "lspconfig"
  local icons = require "user.icons"

  -- INFO: local mappings are available as autocommand when the LSP attaches
  local default_diagnostic_config = {
    signs = {
      active = true,
      values = {
        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
        { name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
        { name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
        { name = "DiagnosticSignInfo",  text = icons.diagnostics.Information },
      },
    },
    virtual_text = false,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(default_diagnostic_config)

  for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
  require("lspconfig.ui.windows").default_options.border = "rounded"

  -- iterates over "M.in_lspsettings_folder" and loads the settings for each server
  for _, server in pairs(M.in_lspsettings_folder) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.common_capabilities(),
    }

    local require_ok, settings = pcall(require, "user.lspsettings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    if server == "lua_ls" then
      require("neodev").setup {}
    end

    lspconfig[server].setup(opts)
  end

  --- @diagnostic disable: unused-local
  require("ufo").setup({
    provider_selector = function(_bufnr, _filetype, _buftype)
      return { "treesitter", "indent" }
    end,
  })
end

return M
