local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

telescope.setup {
	defaults = {
		file_ignore_patterns = { "node_modules/", "build/", "dist/" },
		scroll_strategy = "limit",
		border = true,
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
	}
}