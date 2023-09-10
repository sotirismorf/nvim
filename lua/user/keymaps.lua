local opts = { noremap = true, silent = true }

-- Save buffer
vim.keymap.set("n", "<C-s>", ":w<CR>", opts)

-- Don't copy to clipboard when using "c"
vim.keymap.set("n", "c", '"_c', opts)

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

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
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { noremap = true })
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { noremap = true })
vim.keymap.set("n", "<C-q>", "<cmd>Bdelete<cr>", { noremap = true, desc = "delete buffer" })

-- Move text up and down
vim.keymap.set("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
vim.keymap.set("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --

-- Press jk fast to enter
vim.keymap.set("i", "jj", "<ESC>", opts)

-- Toggle keymaps (i.e. greek/english)
vim.keymap.set("i", "<C-k>", "<C-6>", opts)

-- Visual --

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)
vim.keymap.set("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
