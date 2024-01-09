-- Enable nvim-colorizer.lua
require("colorizer").setup()

-- Enable Comment.nvim
require("Comment").setup()

require("ibl").setup({
	scope = { enabled = false },
})

-- Gitsigns
-- See `:help gitsigns.txt`
require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
})
