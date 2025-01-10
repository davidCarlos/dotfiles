local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.completion.spell,
		null_ls.builtins.diagnostics.mypy,
		null_ls.builtins.formatting.djlint.with({
			filetypes = { "jinja.html", "htmldjango", "django", "jinja" },
		}),
		null_ls.builtins.formatting.prettierd.with({
			disabled_filetypes = { "jinja.html", "htmldjango", "django" },
		}),
		null_ls.builtins.formatting.black,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
})
