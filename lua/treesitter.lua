local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup {
	ensure_installed = {
		"bash",
		"c",
		"vim",
		"javascript",
		"json",
		"lua",
		"python",
		"typescript",
		"yaml",
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
