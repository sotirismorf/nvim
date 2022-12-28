local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	return
end

gitsigns.setup {
	signs = {
		add          = { text = '▎' },
		change       = { text = '▎' },
		topdelete    = { text = '▔' },
		delete       = { text = '▁' },
		changedelete = { text = '▎' },
		untracked    = { text = '┋' },
	},
	current_line_blame_opts = {
		delay = 0,
	},
}
