local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup {
	ensure_installed = {
		"bash",
		"c",
		"help",
		"javascript",
		"json",
		"lua",
		"python",
		"typescript",
		"vim",
		"yaml",
	},

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<Leader>v",
			node_incremental = "+",
			scope_incremental = "=",
			node_decremental = "-",
		},
	},

	auto_install = true,

	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
