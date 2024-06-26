vim.cmd [[
	augroup _general_settings
		autocmd!
		autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
		autocmd BufWinEnter * :set formatoptions-=cro
		autocmd FileType qf set nobuflisted
		autocmd BufNewFile,BufRead */waybar/config setlocal filetype=jsonc
	augroup end

	augroup _text
		autocmd!
		autocmd FileType text setlocal wrap linebreak
	augroup end

	augroup _git
		autocmd!
		autocmd FileType gitcommit setlocal wrap
		autocmd FileType gitcommit setlocal spell
	augroup end

	augroup _markdown
		autocmd!
		" autocmd FileType markdown setlocal wrap linebreak
		autocmd FileType markdown,tex,plaintex setlocal textwidth=80 spell spelllang=el,en_us
	augroup end

	" start in insert mode when opening a terminal
	augroup custom_term_open
		autocmd!
		autocmd TermOpen * startinsert | set winfixheight
	augroup end

	" automatically resize split windows when terminal is resized
	augroup _auto_resize
		autocmd!
		autocmd VimResized * tabdo wincmd =
	augroup end
]]

local function augroup(name)
	return vim.api.nvim_create_augroup("custom_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- indent with 2 spaces
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("wrap_lines"),
	pattern = { "tex" },
	callback = function()
		vim.opt.wrap = true
		vim.opt.linebreak = true
		vim.keymap.set("n", "j", "gj", { desc = "navigate soft-wrapped lines" })
		vim.keymap.set("n", "k", "gk", { desc = "navigate soft-wrapped lines" })
	end,
})

-- indent with 2 spaces
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("indent_with_2_spaces"),
	pattern = {
		"javascript",
		"json",
		"jsonc",
		"markdown",
		"svelte",
		"templ",
		"norg",
		"toml",
		"typescript",
		"yaml",
	},
	callback = function()
		vim.opt.expandtab = true
		vim.opt.shiftwidth = 2
		vim.opt.tabstop = 2
	end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = augroup("auto_create_dir"),
	callback = function(event)
		if event.match:match("^%w%w+://") then
			return
		end
		local file = vim.loop.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("last_loc"),
	callback = function()
		local exclude = { "gitcommit" }
		local buf = vim.api.nvim_get_current_buf()
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
			return
		end
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

vim.api.nvim_create_autocmd('User', {
	pattern = 'GitConflictDetected',
	callback = function()
		-- vim.diagnostic.disable()
		vim.treesitter.stop()
	end
})
