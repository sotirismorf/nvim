vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local opts = {}

require("lazy").setup("plugins")
-- require("lazy").setup(plugins, opts)

-- require "options"
-- require "user.keymaps"
-- require "lazy"
-- require "user.colorscheme"
-- require "user.autopairs"
-- require "user.comment"
-- require "user.gitsigns"
-- require "user.bufferline"
-- require "user.autocommands"
-- require "user.colorizer"
-- require "user.indentline"
-- require "user.nvim-tree"
-- require "user.lualine"
-- require "user.cmp"

-- require "user.whichkey"
-- require "lsp"
