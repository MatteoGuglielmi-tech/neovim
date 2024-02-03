local M = {
  "catppuccin/nvim",
  priority = 1000
}

function M.config()
  require("catppuccin").setup({
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    styles = {
      comments = { "italic" },
      conditionals = {},
      loops = { "bold" },
      functions = { "bold", "italic" },
      keywords = { "italic", "underline" },
      strings = {},
      variables = {},
      numbers = {},
      booleans = { "italic" },
      properties = {},
      types = {},
      operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
      alpha = true,
      fidget = true,
      gitsigns = true,
      harpoon = true,
      indent_blankline = {
        enabled = false,
        scope_color = "sapphire",
        colored_indent_levels = false,
      },
      mason = true,
      neogit = true,
      noice = true,
      cmp = true,
      dap = true,
      dap_ui = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
      navic = { enabled = true, custom_bg = "NONE" },
      notify = true,
      nvimtree = true,
      treesitter = true,
      -- treesitter_context = true,
      ts_rainbow2 = true,
      ufo = true,
      telescope = true,
      lsp_trouble = true,
      illuminate = { enabled = true, lsp = true },
      which_key = true,
      symbols_outline = true,


    },
  })

  vim.cmd.colorscheme "catppuccin-macchiato"
end

return M
