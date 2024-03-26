local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-Space>", "<cmd>WhichKey \\<space><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)
keymap("n", "<ESC>", ":nohlsearch<CR>", opts)

-- Better window navigation
-- m corresponds to alt or meta key
keymap("n", "<M-h>", "<C-w>h", opts)
keymap("n", "<M-j>", "<C-w>j", opts)
keymap("n", "<M-k>", "<C-w>k", opts)
keymap("n", "<M-l>", "<C-w>l", opts)
keymap("n", "<M-tab>", "<c-6>", opts)

-- Window resizing
keymap("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
keymap("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
keymap("n", "<C-left>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<C-right>", "<cmd>vertical resize +2<CR>", opts)

-- lspconfig
keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)


keymap('c', 'mes', "<cmd>messages<CR><esc>")
keymap('c', 'emes', "<esc><cmd>echo v:errmsg<CR>")
keymap('c', 'w!!', "<esc>:lua require'user.sudo'.sudo_write()<CR>", { silent = true })
-- Stay in indent mode
-- REMIND: it is possible to tigger shortcuts for blocks
-- bare in mind % sign allows to match blocks inside brackets
-- ex. <action>a<isntance>. The "a" stands for action
-- dap : deletes a paragraph
-- <ap : indents a paragraph

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move lines up and down
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- yanking --
-- NOTE: the higher registers are not used since I don't even remember what I've eaten yesterday
-- https://www.brianstorti.com/vim-registers/
keymap("n", "P", '"0p', opts)  -- yanking from register 0 keeping the latest deleted text
keymap("n", "P1", '"1p', opts) -- yanking from register 1 keeping the second latest deleted text
keymap("x", "p", [["_dP]])
-- yanked lines are copied to system clipboard
-- INFO: this requires either xclip or xsel to be installed
keymap("v", "<leader>y", [["+y]]) -- copy content from register "+ to system clipboard

vim.cmd [[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]]
vim.cmd [[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]]
