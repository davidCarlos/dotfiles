vim.api.nvim_create_autocmd({ "VimEnter" }, {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_command(":Tmuxline vim_statusline_1")
	end,
})

