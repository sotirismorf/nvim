local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Save buffer
keymap("n", "<C-s>", ":w<CR>", opts)

-- Don't copy to clipboard when using "c"
keymap("n", "c", '"_c', opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Toggle keymaps (i.e. greek/english)
keymap("i", "<C-k>", "<C-6>", opts)

-- Telescope
keymap("n", "<Leader>s", ":Telescope find_files<CR>", opts)
keymap("n", "<Leader>F", ":Telescope live_grep<CR>", opts)

-- Gitsigns
keymap("n", "<Leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", opts)
keymap("n", "<Leader>gB", "<cmd>Gitsigns blame_line<cr>", opts)
keymap("n", "<Leader>gw", "<cmd>Gitsigns toggle_word_diff<cr>", opts)

-- Fold
keymap("n", "<Leader>f", "za", opts)

-- Other
keymap("n", "<Leader>b", ":NvimTreeToggle<CR>", opts)
keymap("n", "<Leader>r", "<cmd>lua require('rest-nvim').run()<CR>", opts)
keymap("n", "<Leader>lI", "<cmd>Mason<cr>", opts)
keymap("n", "<Leader>li", "<cmd>LspInfo<cr>", opts)

-- Buffer move left and right
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Greek --
keymap("i", "ξξ", "<ESC>", opts)
