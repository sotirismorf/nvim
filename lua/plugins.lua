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
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		}
	},
	{ "windwp/nvim-spectre", dependencies = { "nvim-lua/plenary.nvim" } },
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			vim.opt.termguicolors = true
			vim.cmd.colorscheme 'gruvbox'
		end,
	},
	{
		"rest-nvim/rest.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require('rest-nvim').setup()
		end
	},
	{ 'jamespeapen/swayconfig.vim' },
	{ "kyazdani42/nvim-web-devicons" },
	{ "lukas-reineke/indent-blankline.nvim" },

	-- utilities
	{ "christoomey/vim-tmux-navigator" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{ "lewis6991/impatient.nvim" },
	{ "moll/vim-bbye" },
	{ 'windwp/nvim-autopairs', event = "InsertEnter", opts = {} },
	{ 'dstein64/vim-startuptime' },

	{ "jose-elias-alvarez/null-ls.nvim" }, -- for formatters and linters
	{ "b0o/SchemaStore.nvim" },
	{
		'akinsho/git-conflict.nvim',
		version = "*",
		config = true,
		opts = {
			disable_diagnostics = true,
			default_mappings = {
				ours = '<Leader>go',
				theirs = '<Leader>gt',
				none = '<Leader>g0',
				both = '<Leader>ga',
				next = '<Leader>gn',
				prev = '<Leader>gp',
			},
		}
	},
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("neorg").setup {
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.summary"] = {},
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "~/p/repos/git/notes",
							},
						},
					},
				},
			}
		end,
	},
}
