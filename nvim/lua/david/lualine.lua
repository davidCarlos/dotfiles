-- Set lualine as statusline
-- See `:help lualine.txt`
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "gruvbox_dark",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "packer", "NVimTree" },
	},
})
