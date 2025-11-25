-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	-- nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	-- See `:help K` for why this keymap
	-- nmap("K", vim.lsp.buf.hover({ border = "rounded" }), "Hover Documentation")

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		if vim.lsp.buf.format then
			vim.lsp.buf.format()
		elseif vim.lsp.buf.formatting then
			vim.lsp.buf.formatting()
		end
	end, { desc = "Format current buffer with LSP" })

	-- shows code diagnostics automatically
	-- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#show-line-diagnostics-automatically-in-hover-window
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = "rounded",
				source = "always",
				prefix = " ",
				scope = "cursor",
			}
		end,
	})
end

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>D", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>d", vim.diagnostic.setqflist)


-- Setup mason so it can manage external tooling
require("mason").setup()
local servers = { "ts_ls", "lua_ls", "yamlls", "pyright", "vtsls", "vue_ls" }
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_enable = false
})
vim.lsp.enable({ 'lua_ls', 'yamlls', 'pyright' })

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Enable the following language servers
-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
local setupServers = { "lua_ls", "yamlls", "pyright" }
for _, lsp in ipairs(setupServers) do
	vim.lsp.config[lsp] = {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

-- Vue LSP support
-- https://github.com/vuejs/language-tools/wiki/Neovim
local vue_language_server_path = vim.fn.stdpath('data') ..
    "/mason/packages/vue-language-server/node_modules/@vue/language-server"
local vue_plugin = {
	name = '@vue/typescript-plugin',
	location = vue_language_server_path,
	languages = { 'vue' },
	configNamespace = 'typescript',
}
local vtsls_config = {
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					vue_plugin,
				},
			},
		},
	},
	filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
}
vim.lsp.config('vtsls', vtsls_config)
vim.lsp.config('vue_ls', {})
vim.lsp.enable({ 'vtsls', 'vue_ls' })

--ts_ls LSP client configuration
vim.lsp.config.ts_ls = {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
}
vim.lsp.enable({ 'ts_ls' })

--Ruby LSP client configuration
vim.lsp.config.solargraph = {
	settings = {
		solargraph = {
			autoformat = true,
			formatting = true,
		},
	},
	on_attach = on_attach,
}

-- Example custom configuration for lua
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

vim.lsp.config.lua_ls = {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = { enable = false },
			diagnostics = { disable = { 'missing-fields' } }
		},
	},
}

-- https://www.reddit.com/r/neovim/comments/tkcvlc/how_do_you_tame_lsp_diagnostic_messages/
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	float = {
		border = "rounded",
		format = function(diagnostic)
			return string.format(
				"%s (%s) [%s]",
				diagnostic.message,
				diagnostic.source,
				diagnostic.code or diagnostic.user_data.lsp.code
			)
		end,
	},
})

-- null_ls (none-ls) turns Neovim into a LSP server
local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.djlint.with({
			filetypes = { "jinja.html", "htmldjango", "django", "jinja" },
		}),
		null_ls.builtins.formatting.black,
		null_ls.builtins.completion.spell,
		null_ls.builtins.diagnostics.mypy,
		null_ls.builtins.diagnostics.djlint.with({
			filetypes = { "jinja.html", "htmldjango", "django", "jinja" },
		}),
		-- code_actions for python and other languages
		null_ls.builtins.code_actions.refactoring
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
					vim.lsp.buf.format()
				end,
			})
		end
	end,
})

-- none-ls prettierd integration changes the cursor position after saving.
-- Conform formatting fixes this behavior.
require("conform").setup({
	formatters_by_ft = {
		vue = { "prettierd", "prettier", stop_after_first = true },
	},
})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})


-- Turn on lsp status information
require("fidget").setup()
-- LSP signature hint as you type
require("lsp_signature").setup()
require("luasnip.loaders.from_vscode").lazy_load()
