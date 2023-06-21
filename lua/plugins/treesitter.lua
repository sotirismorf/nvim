return {
	'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"css",
			"http",
			"javascript",
			"json",
			"lua",
			"python",
			"query",
			"sql",
			"svelte",
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

		playground = {
			enable = true
		},

		auto_install = false,

		autopairs = {
			enable = true,
		},
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	}
}
