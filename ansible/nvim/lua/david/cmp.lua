require("luasnip.loaders.from_vscode").lazy_load()
local cmp = require('cmp')
local compare = require('cmp.config.compare')

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	-- set id to control the sorting algorithm
	sources = cmp.config.sources({
		{ name = 'nvim_lsp', id = 1 },
		{ name = 'luasnip',  id = 2 }, -- For luasnip users.
		{ name = 'buffer',   id = 3 },
		{ name = 'cmdline',  id = 4 }
	}),

	-- https://github.com/hrsh7th/nvim-cmp/issues/511
	-- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#basic-customisations
	formatting = {
		format = function(entry, item)
			-- removes duplicate suggestions in the cmp menu
			item.dup = ({
				buffer = 0,
				path = 0,
				nvim_lsp = 1,
				nvim_lua = 1,
				luasnip = 1,
			})[entry.source.name] or 0
			item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
			})[entry.source.name]
			return item
		end
	},
	-- customize how the suggestions are listed inside the cmp menu
	sorting = {
		priority_weight = 2,
		comparators = {
			compare.order,
		}
	},
	-- disable cmp completion in comments
	-- This does not works for Python comments using triple quotes
	enabled = function()
		local disabled = false
		disabled = disabled or (vim.api.nvim_get_option_value('buftype', { buf = 0 }) == 'prompt')
		disabled = disabled or (vim.fn.reg_recording() ~= '')
		disabled = disabled or (vim.fn.reg_executing() ~= '')
		disabled = disabled or require('cmp.config.context').in_treesitter_capture('comment')
		return not disabled
	end,
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'git' },
	}, {
		{ name = 'buffer' },
	})
})
require("cmp_git").setup() ]] --

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})
--
-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({ { name = "cmdline" } })
})

-- -- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- vim.lsp.config('<YOUR_LSP_SERVER>', {
-- 	capabilities = capabilities
-- })
-- vim.lsp.enable('<YOUR_LSP_SERVER>')
