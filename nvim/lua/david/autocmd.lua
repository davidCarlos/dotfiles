vim.api.nvim_create_autocmd({ "BufRead" }, {
	pattern = { "*.jinja2" },
	callback = function()
		vim.api.nvim_command(":set filetype=html")
	end,
})
vim.api.nvim_create_autocmd({ "BufNewFile" }, {
	pattern = { "*.jinja2" },
	callback = function()
		vim.api.nvim_command(":set filetype=html")
	end,
})
vim.api.nvim_create_autocmd({ "BufNew" }, {
	pattern = { "*.jinja2" },
	callback = function()
		vim.api.nvim_command(":set filetype=html")
	end,
})
