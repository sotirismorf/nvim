return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function()
		require("nvim-treesitter.configs").setup {
			ensure_installed = {
				"bash",
				"c",
				"css",
				"dockerfile",
				"http",
				"javascript",
				"json",
				"jsonc",
				"lua",
				"markdown",
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
	end,
	-- opts = {}
}
