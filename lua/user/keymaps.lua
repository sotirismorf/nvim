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
vim.keymap.set("n", "<Leader>s", require('telescope.builtin').find_files, { desc = "find files" })
vim.keymap.set("n", "<Leader>F", require('telescope.builtin').live_grep, { desc = "live grep" })

-- Gitsigns
vim.keymap.set("n", "<Leader>gb", require("gitsigns").toggle_current_line_blame, { desc = "toggle line blame" })
vim.keymap.set("n", "<Leader>gB", require("gitsigns").blame_line, { desc = "hover blame" })
vim.keymap.set("n", "<Leader>gw", require("gitsigns").toggle_word_diff, { desc = "toggle word diff" })

-- Fold
vim.keymap.set("n", "<Leader>f", "za", { desc = "toggle fold" })

-- File explorer

-- Other
vim.keymap.set("n", "<Leader>b", ":NvimTreeToggle<CR>", { desc = "toggle file Explorer" })
vim.keymap.set("n", "<Leader>r", require('rest-nvim').run, { desc = "send HTTP request" })

-- LSP
vim.keymap.set("n", "<Leader>lI", "<cmd>Mason<cr>", { desc = "Mason Interface" })
vim.keymap.set("n", "<Leader>li", "<cmd>LspInfo<cr>", { desc = "LSP Info" })

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
