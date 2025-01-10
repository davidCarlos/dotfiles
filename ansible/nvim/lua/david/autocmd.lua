notify = require("notify")

vim.api.nvim_create_autocmd({ "BufRead" }, {
	pattern = { "*.jinja2" },
	callback = function()
		-- https://neovim.io/doc/user/api.html#nvim_exec2()
		local result = vim.api.nvim_exec2(":set filetype=html", { output = true })
		if result then
			notify("set filetype as html")
		end
	end,
})
vim.api.nvim_create_autocmd({ "BufNewFile" }, {
	pattern = { "*.jinja2" },
	callback = function()
		-- https://neovim.io/doc/user/api.html#nvim_exec2()
		local result = vim.api.nvim_exec2(":set filetype=html", { output = true })
		if result then
			notify("set filetype as html")
		end
	end,
})
