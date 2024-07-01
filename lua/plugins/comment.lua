-- return {}
return {
	"numToStr/Comment.nvim",
	opts = {
		padding = true,
		sticky = true,
		ignore = nil,
		toggler = {
			line = '<leader>c',
			block = '<leader>C',
		},
		opleader = {
			line = '<leader>c',
			block = '<leader>C',
		},
		extra = {
			above = 'gcO',
			below = 'gco',
			eol = 'gcA',
		},
		mappings = {
			basic = true,
			extra = true,
			extended = false,
		},
		pre_hook = nil,
		post_hook = nil,
	}
}
