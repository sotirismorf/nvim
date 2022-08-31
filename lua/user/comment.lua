local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

-- https://github.com/numToStr/Comment.nvim/blob/master/doc/Comment.txt
comment.setup {
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
