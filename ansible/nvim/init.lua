-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	vim.cmd([[packadd packer.nvim]])
end
--
require("packer").startup(function(use)
	-- Package manager
	use("wbthomason/packer.nvim")

	use({ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		requires = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			{ "j-hui/fidget.nvim", tag = "legacy" },
		},
	})

	use({ -- Autocompletion
		"hrsh7th/nvim-cmp",
		requires = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
	})

	-- vscode snippets
	use({ "rafamadriz/friendly-snippets" })

	use({ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		run = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	})

	use({ -- Additional text objects via treesitter
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	})

	-- Git related plugins
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")
	use("lewis6991/gitsigns.nvim")

	use("numToStr/Comment.nvim") -- "gc" to comment visual regions/lines
	use("tpope/vim-sleuth") -- Detect tabstop and shiftwidth automatically

	use({
		"nvim-lualine/lualine.nvim", -- Fancier statusline
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use("mattn/emmet-vim")
	use("leafOfTree/vim-vue-plugin")
	use("prettier/vim-prettier")

	-- Fuzzy Finder (files, lsp, etc)
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.3", requires = { "nvim-lua/plenary.nvim" } })

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable("make") == 1 })

	-- improved tabs
	use("nvim-tree/nvim-web-devicons")
	use("kdheepak/tabline.nvim")

	-- improved hover documentation
	use({ "lewis6991/hover.nvim" })

	-- gruvbox port for lua
	use({ "ellisonleao/gruvbox.nvim" })

	-- A format runner for Neovim.
	use({ "mhartington/formatter.nvim" })

	use({ "lukas-reineke/indent-blankline.nvim" })

	-- A tree like view for symbols in Neovim using the Language Server Protocol.
	-- Supports all your favourite languages.
	use({ "simrat39/symbols-outline.nvim" })

	-- treefile explorer writen in lua
	use({ "nvim-tree/nvim-tree.lua" })

	-- CSS color preview
	use({ "NvChad/nvim-colorizer.lua" })

	-- Helper to add (), {} and other surrounding pairs
	-- example: on normal mode, executes ysw", to add "word"
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})

	-- Automatically adds (), {} and ""
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- syntax highlight for nginx conf files
	use({ "chr4/nginx.vim" })

	-- This is the latest version of the Jinja2 syntax file for vim with the ability to detect either HTML or Jinja.
	use({ "Glench/Vim-Jinja2-Syntax" })

	-- This is the oficial Black plugin to vim/neovim. I tried to
	-- configure autoformating with python-lsp-black, but the integration with
	-- python-lsp-server was not working well.
	-- Check david.autocmd.lua, to see how i am formating python files on save.
	use({ "psf/black", branch = "stable" })

	use({ "junegunn/vim-easy-align" })

	-- https://github.com/preservim/vim-markdown#installation
	-- Markdown support
	use({ "godlygeek/tabular" })
	use({ "preservim/vim-markdown" })

	use({ "rcarriga/nvim-notify" })

	use({ "nvimtools/none-ls.nvim" })

	use({ "ray-x/lsp_signature.nvim" })

	use({ "shaunsingh/nord.nvim" })

	use({ "TaDaa/vimade" })

	-- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
	local has_plugins, plugins = pcall(require, "custom.plugins")
	if has_plugins then
		plugins(use)
	end

	if is_bootstrap then
		require("packer").sync()
	end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
	print("==================================")
	print("    Plugins are being installed")
	print("    Wait until Packer completes,")
	print("       then restart nvim")
	print("==================================")
	return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source <afile> | PackerCompile",
	group = packer_group,
	pattern = vim.fn.expand("$MYVIMRC"),
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

require("david")
