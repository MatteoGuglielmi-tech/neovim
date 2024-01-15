local M = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
}


function M.config()
  require("tokyonight").setup({
    style = "moon",         -- `storm`, `moon`, a darker variant `night` and `day`
    transparent = false,    -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
    styles = {
      comments = { italic = true },
      keywords = { italic = true, underline = true },
      functions = { bold = true },
      variables = {},
      -- Background styles. Can be "dark", "transparent" or "normal"
      sidebars = "dark",              -- style for sidebars, see below
      floats = "transparent",         -- style for floating windows
    },
    sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    dim_inactive = false,             -- dims inactive windows
    lualine_bold = true,              -- When `true`, section headers in the lualine theme will be bold
  })

  -- this is important otherwise no colorscheme will be loaded
  -- IMPORTANT: load this after require
  vim.cmd [[
    colorscheme tokyonight
  ]]
end

-- local M = {
--   "rose-pine/neovim",
--   lazy = false,    -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
-- }
--
-- function M.config()
--   vim.cmd.colorscheme "rose-pine"
-- end

return M
