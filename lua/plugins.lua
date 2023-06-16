-- Install packer if not installed
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
	vim.cmd [[packadd packer.nvim]]
end

-- source this file when saved
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile>
	augroup end
]]

require('packer').startup(function(use)
	use "wbthomason/packer.nvim"

	-- LSP
	use {
		"neovim/nvim-lspconfig",
		requires = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			'folke/neodev.nvim',
		}
	}

	-- completion
	use {
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip"
		}
	}

	use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
	use {
		"rest-nvim/rest.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function() require('rest-nvim').setup() end
	}
	use { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } }
	use { "windwp/nvim-spectre", requires = { "nvim-lua/plenary.nvim" } }

	-- syntax/visual
	use 'nvim-treesitter/playground'
	use "ellisonleao/gruvbox.nvim"
	use 'jamespeapen/swayconfig.vim'
	use "NvChad/nvim-colorizer.lua"
	use "kyazdani42/nvim-web-devicons"
	use "lukas-reineke/indent-blankline.nvim"
	use "nvim-lualine/lualine.nvim"

	-- components
	use "kyazdani42/nvim-tree.lua"
	use "akinsho/bufferline.nvim"
	use "folke/which-key.nvim"

	-- utilities
	use "JoosepAlviste/nvim-ts-context-commentstring"
	use "lewis6991/gitsigns.nvim"
	use "lewis6991/impatient.nvim"
	use "moll/vim-bbye"
	use "numToStr/Comment.nvim"
	use "windwp/nvim-autopairs"
	use 'dstein64/vim-startuptime'

	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
	use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
	use "b0o/SchemaStore.nvim"

	if is_bootstrap then
		require('packer').sync()
	end
end)
