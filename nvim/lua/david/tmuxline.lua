vim.api.nvim_create_autocmd({ "VimEnter" }, {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_command(":Tmuxline vim_statusline_1")
	end,
})

-- Formatter plugin was not working with black binary.
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.py" },
	callback = function()
		vim.api.nvim_command(":!black --quiet --line-length 80 %")
	end,
})
