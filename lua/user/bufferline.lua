local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

-- https://github.com/akinsho/bufferline.nvim/blob/main/doc/bufferline.txt
bufferline.setup {
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
	}
}
