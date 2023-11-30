local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local keymaps = {
  m = {
    name = "Markdown Preview",
    o = { "<cmd>MarkdownPreview<CR>", "Open preview" },
    c = { "<cmd>MarkdownPreviewStop<CR>", "Close preview" }
  }
}

local opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

which_key.register(keymaps, opts)
