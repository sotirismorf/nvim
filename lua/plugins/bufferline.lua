return {
	"akinsho/bufferline.nvim",
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			diagnostics_update_in_insert = false,
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "center"
				}
			},
			indicator = {
				icon = ' ',
				style = 'icon'
			},
			left_trunc_marker = '',
			right_trunc_marker = '',
			show_buffer_close_icons = false,
			show_close_icon = false,
			separator_style = { ' ', ' ' }
		}
	}
}
