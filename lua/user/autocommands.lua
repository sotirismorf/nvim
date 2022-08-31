vim.cmd [[
	augroup _general_settings
		autocmd!
		autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
		autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
		autocmd BufWinEnter * :set formatoptions-=cro
		autocmd FileType qf set nobuflisted
		autocmd BufRead */waybar/config set syntax=jsonc
	augroup end

	augroup _git
		autocmd!
		autocmd FileType gitcommit setlocal wrap
		autocmd FileType gitcommit setlocal spell
	augroup end

	augroup _markdown
		autocmd!
		autocmd FileType markdown setlocal wrap
		autocmd FileType markdown setlocal linebreak
		" autocmd FileType markdown setlocal spell spelllang=el,us
	augroup end

	augroup _javascript
		autocmd!
		autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab 
	augroup end

	augroup _typescript
		autocmd!
		autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 expandtab 
	augroup end

	augroup _json
		autocmd!
		autocmd FileType json setlocal shiftwidth=2 tabstop=2 expandtab 
	augroup end

	augroup _auto_resize
		autocmd!
		autocmd VimResized * tabdo wincmd = 
	augroup end

	augroup _alpha
		autocmd!
		autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
	augroup end
]]

-- Autoformat
-- augroup _lsp
--	 autocmd!
--	 autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end
