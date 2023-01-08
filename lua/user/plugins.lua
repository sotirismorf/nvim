local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

return packer.startup(function(use)
	use "wbthomason/packer.nvim" -- Have packer manage itself

	-- syntax/visual
	use "tranvansang/octave.vim"
	use 'jamespeapen/swayconfig.vim'
	use "NvChad/nvim-colorizer.lua"
	use "kyazdani42/nvim-web-devicons"
	use "lukas-reineke/indent-blankline.nvim"

	-- components
	use "kyazdani42/nvim-tree.lua"
	use "nvim-lualine/lualine.nvim"
	use "akinsho/bufferline.nvim"
	use "folke/which-key.nvim"

	-- utilities
	use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
	use "numToStr/Comment.nvim" -- Easily comment stuff
	use 'dstein64/vim-startuptime'
	use "JoosepAlviste/nvim-ts-context-commentstring"
	use "nvim-telescope/telescope.nvim"
	use "lewis6991/gitsigns.nvim"
	use "lewis6991/impatient.nvim" -- Monitor startup time
	use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
	use "moll/vim-bbye" -- Better close buffer handling
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}

	-- Colorschemes
	use "ellisonleao/gruvbox.nvim"

	-- cmp plugins
	use "hrsh7th/nvim-cmp" -- The completion plugin
	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-path" -- path completions
	use "hrsh7th/cmp-cmdline" -- cmdline completions
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use "hrsh7th/cmp-nvim-lsp"

	-- snippets
	use "L3MON4D3/LuaSnip" --snippet engine
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- LSP
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig"
	}

	use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
	use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
	use "b0o/SchemaStore.nvim"

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
