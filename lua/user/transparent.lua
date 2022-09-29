local status_ok, transparent = pcall(require, "transparent")
if not status_ok then
	return
end

transparent.setup({
	enable = true, -- boolean: enable transparent
	extra_groups = { -- table/string: additional groups that should be cleared
		-- To see all currently used groups, run:
		-- :so $VIMRUNTIME/syntax/hitest.vim

		"GruvboxGreenSign",
		"GruvboxAquaSign",
		"GruvboxBlueSign",
		"GruvboxYellowSign",
		"GruvboxPurpleSign",
		"GruvboxRedSign",

		"VertSplit",

		"StatusLine",
		

		-- example of akinsho/nvim-bufferline.lua
		-- "BufferlineBufferSelected",
		-- "BufferLineCloseButtonSelected",
		--
		-- "BufferLineDevIconDefaultSelected",
		-- "BufferLineTabClose",
		-- "BufferLineCloseButtonVisible",
		-- "BufferLineCloseButton",
		-- "BufferLineDevIconDefaultInactive",
		--
		-- "BufferLineDevIconLuaInactive",
		--
		--
		-- "BufferLineSeparatorVisible",
		-- "BufferLineDevIconLua",
		-- "BufferLineDevIconMarkdown",
		-- "BufferLineDevIconHtml",
		-- "BufferLineDevIconHtmlInactive",
		--
		-- "BufferLineCloseButtonVisible",
		"BufferLineFill",
		-- "BufferLineBackground",
		-- "BufferLineSeparator",
		-- "BufferLineIndicatorSelected",
	},
	exclude = {}, -- table: groups you don't want to clear
})
