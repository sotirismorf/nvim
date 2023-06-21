return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'williamboman/mason.nvim', config = true },
			{ 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
			'williamboman/mason-lspconfig.nvim',
			'folke/neodev.nvim',
		},
	},
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets"
		},
	},
	{ "windwp/nvim-spectre", dependencies = { "nvim-lua/plenary.nvim" } },

	-- syntax/visual
	-- { 'nvim-treesitter/playground' },
	{ "ellisonleao/gruvbox.nvim" },
	{ 'jamespeapen/swayconfig.vim' },
	{ "kyazdani42/nvim-web-devicons" },
	{ "lukas-reineke/indent-blankline.nvim" },

	-- components
	{ 'folke/which-key.nvim',  opts = {} },

	-- utilities
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{ "lewis6991/impatient.nvim" },
	{ "moll/vim-bbye" },
	{ "windwp/nvim-autopairs" },
	{ 'dstein64/vim-startuptime' },

	{ "jose-elias-alvarez/null-ls.nvim" }, -- for formatters and linters
	{ "b0o/SchemaStore.nvim" },
}
