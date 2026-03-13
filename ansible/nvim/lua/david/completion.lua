local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		-- Dependending of the selected language server, function args and brackets will not be added automatically.
		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		-- ["<Tab>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_next_item()
		-- 	elseif luasnip.expand_or_jumpable() then
		-- 		luasnip.expand_or_jump()
		-- 	elseif has_words_before() then
		-- 		cmp.complete()
		-- 	else
		-- 		fallback()
		-- 	end
		-- 	end, { "i", "s" }),
		-- 	["<S-Tab>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_prev_item()
		-- 	elseif luasnip.jumpable(-1) then
		-- 		luasnip.jump(-1)
		-- 	else
		-- 		fallback()
		-- 	end
		-- 	end, { "i", "s" }),



	}),

	sources = cmp.config.sources({
		{ name = "luasnip", option = { show_autosnippets = true } },
		{ name = "nvim_lsp" },
		{ name = "path" },
	}, {

			{ name = "buffer" }
		})
	})
--
-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

 -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

 -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- https://github.com/hrsh7th/nvim-cmp/issues/1454#issuecomment-1439850984
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
	{ name = 'path' },
	}, {
      { name = 'cmdline' }
    }),
    mapping = cmp.mapping.preset.cmdline({
    ['<Tab>'] = {
      c = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-z>', true, true, true), 'ni', true)
        end
      end
    }
  })
  })


-- Add () after confirming autocomplete with nvim-cmp
require("nvim-autopairs").setup()
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
