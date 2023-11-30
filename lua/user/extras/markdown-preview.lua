local M = {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
}

function M.build()
  vim.fn["mkdp#util#install"]()
end

function M.init()
  vim.g.mkdp_auto_start = 0
  vim.g.mkdp_filetypes = { "markdown" }
  vim.g.mkdp_browser = 'safari'
  vim.g.mkdp_theme = 'dark'
end

return M
