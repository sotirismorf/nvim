return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {
		defaults = {
			file_ignore_patterns = { "node_modules/", "build/", "dist/" },
			scroll_strategy = "limit",
			border = true,
			borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		}
	}
}
