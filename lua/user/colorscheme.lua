vim.cmd [[
try
	colorscheme gruvbox
	set background=dark
	hi normal       ctermbg=NONE guibg=NONE
	hi vertsplit    ctermbg=NONE guibg=NONE
	hi cursorline   ctermbg=NONE guibg=NONE
	hi cursorlinenr ctermbg=NONE guibg=NONE
	hi signcolumn   ctermbg=NONE guibg=NONE
	hi link gitgutteradd gruvboxgreen 
	hi link gitgutterchange gruvboxblue 
catch /^Vim\%((\a\+)\)\=:E185/
	colorscheme default
  	set background=dark
endtry
]]

-- Background
--   hi normal ctermbg=NONE
-- Line between buffers
--   hi vertsplit ctermfg=fg ctermbg=NONE cterm=NONE
-- Unfocused buffer's statusline
-- hi statuslinenc cterm=NONE ctermbg=NONE ctermfg=fg 
-- Focused buffer's statusline
-- hi statusline cterm=NONE ctermbg=NONE ctermfg=fg
