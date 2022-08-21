local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup {
	--ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ensure_installed = {
		"bash",
		"c",
		"css",
		"html",
		"http",
		"java",
		"javascript",
		"jsdoc",
		"json5",
		"jsonc",
		"latex",
		"make",
		"markdown",
		"markdown_inline",
		"prisma",
		"python",
		"rust",
		"scss",
		"slint",
		"sql",
		"svelte",
		"toml",
		"typescript",
		"vim",
		"vue",
		"yaml",
	},

	auto_install = true,
	sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)

	ignore_install = { "" }, -- List of parsers to ignore installing
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	additional_vim_regex_highlighting = false,
}
