notify = require("notify")

-- htmldjango filetype has better hightlight support.
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "*.html", "*.jinja2" },
	callback = function()
		-- https://neovim.io/doc/user/api.html#nvim_exec2()
		local filetype_table =  vim.api.nvim_exec2(":set filetype?", { output = true })
		if string.find(filetype_table.output, "jinja.html") then
			local result = vim.api.nvim_exec2(":set filetype=htmldjango", { output = true })
			if result then
				notify("set filetype as htmldjango")
			end
		end
	end,
})
