-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require("nvim-treesitter.configs").setup({
	-- Add languages to be installed here that you want installed for treesitter
	sync_install = false,
	auto_install = true,
	ensure_installed = {
		"go",
		"lua",
		"python",
		"rust",
		"typescript",
		"help",
		"javascript",
		"html",
		"css",
		"dockerfile",
		"json",
		"markdown",
		"toml",
		"vue",
		"htmldjango"
	},

	highlight = { enable = true },
	indent = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<c-space>",
			node_incremental = "<c-space>",
			scope_incremental = "<c-s>",
			node_decremental = "<c-backspace>",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		swap = {
			enable = true,
			-- swap_next = {
			--   ['<leader>a'] = '@parameter.inner',
			-- },
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
	},
	matchup = {
		enable = true
	}
})

local ibl = require("ibl")
ibl.setup({
	indent = { char = "▎" },
	scope = { show_start = false }

})
