-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	-- changes nvim-tree root when neovim root changes.
	sync_root_with_cwd = true,
	view = {
		width = 35,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})

-- [[ NerdTree maps ]]
vim.keymap.set("n", "<leader>F", function()
	vim.api.nvim_command(":NvimTreeToggle")
end)

vim.keymap.set("n", "<leader>IF", function()
	vim.api.nvim_command(":NvimTreeFindFile")
end)

-- change NvimTree background
vim.api.nvim_command(" :highlight NvimTreeNormal guibg = #232323")
