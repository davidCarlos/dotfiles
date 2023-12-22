-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`

-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<leader>s", vim.cmd.split)
vim.keymap.set("n", "<leader>v", vim.cmd.vsplit)
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

vim.keymap.set("n", "<leader>q", ":q<cr>")

vim.keymap.set("n", "hh", ":")

vim.keymap.set("n", "ll", vim.cmd.w)
vim.keymap.set("n", "<leader>x", vim.cmd.x)

vim.keymap.set("n", "<C-t>", ":tabnew<cr>")
vim.keymap.set("n", "<A-l>", ":tabnext<cr>")
vim.keymap.set("n", "<A-h>", ":tabprev<cr>")
vim.keymap.set("n", "<leader>b", ":b#<cr>")

vim.keymap.set("n", "<leader>r", ":so<cr>")

vim.keymap.set("n", "<leader>e", ":e!<cr>")
vim.keymap.set("v", "yy", '"+y')
vim.keymap.set("v", "yy", '"+y')

-- [[ Fugitive maps ]]
vim.keymap.set("n", "<leader>G", ":Git ")
vim.keymap.set("n", "<leader>gs", ":Git<cr>")
vim.keymap.set("n", "<leader>gc", ":Git commit<cr>")
vim.keymap.set("n", "<leader>gpl", ":Git pull ")
vim.keymap.set("n", "gik", ":Git checkout %<cr>")
vim.keymap.set("n", "gp", ":Git push origin")
vim.keymap.set("n", "<leader>gl", ":Git log<cr>")

vim.keymap.set("n", "<C-q>", "%", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>V", ":SymbolsOutline<cr>")

vim.keymap.set("n", "<leader>o", ":only<cr>")
vim.keymap.set("n", "gq", ":vimgrep  %<C-left><Left>")
vim.keymap.set("n", "co", ":copen<cr>")

-- https://vimtricks.com/p/vimtrick-moving-lines/
-- move lines and block of lines with <c-j> and <c-k>
vim.keymap.set("n", "<leader>x", ":m .+1<CR>==")
vim.keymap.set("n", "<leader>z", ":m .-2<CR>==")
vim.keymap.set("i", "<leader>x", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<leader>z", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("v", "<leader>x", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<leader>z", ":m '<-2<CR>gv=gv")
