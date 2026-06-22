-- https://github.com/nvim-lualine/lualine.nvim/wiki/Writing-a-theme
-- https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#customizing-themes
-- Customizing neovim default theme to avoid white background.
local custom_default = require 'lualine.themes.auto'
custom_default.insert.c.bg = '#1e1e1e'
custom_default.visual.c.bg = '#1e1e1e'
custom_default.command.c.bg = '#1e1e1e'
custom_default.inactive.c.bg = '#1e1e1e'

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = custom_default,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "packer", "NVimTree" },
	},
})
