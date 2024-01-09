vim.api.nvim_create_autocmd({ "BufRead" }, {
	pattern = { "*.jinja2" },
	callback = function()
		vim.api.nvim_command(":set filetype=html")
	end,
})

-- pylsp server does not format automatically on save.
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.py" },
	callback = function()
		local notify = require("notify")
		notify(vim.api.nvim_command(":Black"))
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

-- -- fixes filetree custom  configurations
-- vim.cmd([[ autocmd FileType * :lua setup_tabs() ]])
