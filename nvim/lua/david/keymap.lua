-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`

-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


vim.keymap.set("n", "<leader>s", vim.cmd.split)
vim.keymap.set("n", "<leader>v", vim.cmd.vsplit)
vim.keymap.set('n', '<C-j>', "<C-w>j")
vim.keymap.set('n', '<C-k>', "<C-w>k")
vim.keymap.set('n', '<C-h>', "<C-w>h")
vim.keymap.set('n', '<C-l>', "<C-w>l")

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

vim.keymap.set('n', '<leader>q', ":q<cr>")

vim.keymap.set('n', 'hh', ':')

vim.keymap.set('n', 'll', vim.cmd.w)
vim.keymap.set('n', '<leader>q', vim.cmd.q)
vim.keymap.set('n', '<leader>x', vim.cmd.x)



vim.keymap.set('n', '<C-t>', ':tabnew<cr>')
vim.keymap.set('n', '<A-l>', ':tabnext<cr>')
vim.keymap.set('n', '<A-h>', ':tabprev<cr>')
vim.keymap.set('n', '<leader>b', ':b#<cr>')

vim.keymap.set('n', '<leader>r', ":so<cr>")


vim.keymap.set('n', '<leader>e', ':e!<cr>')
vim.keymap.set('v', 'yy', '"+y')

-- [[ Fugitive maps ]]
vim.keymap.set('n', 'gs', ':vert Git<cr>')
vim.keymap.set('n', '<leader>gc', ':vert Git commit<cr>')
vim.keymap.set('n', '<leader>gpl', ':Git pull<cr>')
vim.keymap.set('n', 'gik', ':Git checkout %<cr>')
vim.keymap.set('n', 'gp', ':Git push')
vim.keymap.set('n', '<leader>gl', ':vert Git log<cr>')

vim.keymap.set('n', '<C-q>', '%', {noremap = true, silent = true})

-- [[ NerdTree maps ]]
vim.keymap.set('n', '<leader>F', function() vim.api.nvim_command(':NERDTreeToggle') end)
vim.keymap.set('n', '<leader>IF', function() vim.api.nvim_command(':NERDTreeFind') end)
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	pattern = { "*" },
	callback = function() vim.api.nvim_command(":Tmuxline vim_statusline_1") end
})

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
-- 	pattern = { "*.tsx", "*.ts", "*.css", "*.js", "*.html", "*.yaml" },
-- 	callback = function() vim.api.nvim_command(":PrettierAsync") end
-- })

-- -- autoformat on save using LSP function
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
-- 	pattern = { "*.py", "*.go", "*.jinja2" },
-- 	callback = function() vim.api.nvim_command(":Format") end
-- })
