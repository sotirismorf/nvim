local o = vim.opt

o.backup = false -- creates a backup file
o.clipboard = "unnamedplus"
o.cmdheight = 1 -- more space in the neovim command line for displaying messages
o.completeopt = { "menu", "menuone", "noselect", "noinsert" }
o.conceallevel = 0 -- so that `` is visible in markdown files
o.fileencoding = "utf-8" -- the encoding written to a file
o.guifont = "monospace:h14" -- the font used in graphical neovim applications
o.hlsearch = true -- highlight all matches on previous search pattern
o.ignorecase = true -- ignore case in search patterns
o.incsearch = true -- set numbered lines
o.mouse = "a"
o.number = true -- set numbered lines
o.numberwidth = 4 -- set number column width to 2 {default 4}
o.pumheight = 10 -- pop up menu height
o.relativenumber = true
o.shortmess:append "c"
o.showmode = false -- we don't need to see things like -- INSERT -- anymore
o.showtabline = 2 -- always show tabs
o.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
o.smartcase = true -- smart case
o.smartindent = true
o.splitbelow = true
o.splitright = true
o.swapfile = false -- creates a swapfile
o.termguicolors = true
o.timeoutlen = 200 -- time to wait for a mapped sequence to complete (in milliseconds)
o.undofile = true -- enable persistent undo
o.updatetime = 300 -- faster completion (4000ms default)
o.wrap = false
o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-- load greek keymap
o.keymap = "greek_utf-8"
o.iminsert = 0 -- disable greek by default
o.imsearch = -1 -- searching uses the same keymap as insert mode

-- text folding
o.fillchars = { fold = " " }
o.foldenable = false
o.foldlevel = 99
o.foldmethod = "indent"

-- tabs and spaces stuff
o.expandtab = false -- convert tabs to spaces
o.shiftwidth = 4 -- the number of spaces inserted for each indentation
o.tabstop = 4 -- insert 2 spaces for a tab

-- start scrolling before reaching the end
o.scrolloff = 20
o.sidescrolloff = 20

vim.filetype.add({ extension = { templ = "templ" } })

vim.cmd "let g:loaded_perl_provider = 0"
vim.cmd "let g:loaded_ruby_provider = 0"
vim.cmd 'let $PATH = $NVM_DIR . "/versions/node/v20.11.1/bin:" . $PATH'
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
