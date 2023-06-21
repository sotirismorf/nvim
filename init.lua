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

require("lazy").setup("plugins")

-- require "options"
require "user.keymaps"

-- require "user.autopairs"
-- require "user.gitsigns"
-- require "user.autocommands"
-- require "user.colorizer"
-- require "user.indentline"
-- require "user.lualine"
-- require "user.cmp"

-- require "user.whichkey"
-- require "lsp"

vim.cmd("colorscheme gruvbox")
