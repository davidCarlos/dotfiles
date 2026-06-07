local gh = function(x) return 'https://github.com/' .. x end
vim.pack.add({
  gh("neovim/nvim-lspconfig"),
  gh("williamboman/mason.nvim"),
  gh("williamboman/mason-lspconfig.nvim"),
  -- Autocompletion
  gh("hrsh7th/nvim-cmp"),
  gh("neovim/nvim-lspconfig"),
  gh("hrsh7th/cmp-nvim-lsp"),
  gh("hrsh7th/cmp-buffer"),
  gh("hrsh7th/cmp-path"),
  gh("hrsh7th/cmp-cmdline"),
  gh("hrsh7th/nvim-cmp"),
  gh("onsails/lspkind.nvim"),
  -- LSP
  gh("stevearc/conform.nvim"),
  gh("j-hui/fidget.nvim"), 
  gh("ray-x/lsp_signature.nvim"), 
  gh("nvimtools/none-ls.nvim"), 
  -- Snippets
  gh("L3MON4D3/LuaSnip"),
  gh("saadparwaiz1/cmp_luasnip"),
  gh("rafamadriz/friendly-snippets"),
  -- treefile explorer
  gh("nvim-tree/nvim-tree.lua"),
  -- fuzzy finder
  gh("nvim-lua/plenary.nvim"), 
  gh("nvim-telescope/telescope.nvim"),
  -- git
  gh("tpope/vim-fugitive"),
  gh("lewis6991/gitsigns.nvim"),
  -- treesiter
  { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" }
})

require("david")
