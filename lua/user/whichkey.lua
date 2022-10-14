local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = false, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = false
		},
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "none", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 0, 4, 2, 4 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["b"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
	l = {
		name = "LSP",
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = {
			"<cmd>lua vim.diagnostic.goto_next { float = { show_header = true } }<cr>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.diagnostic.open_float(0, { scope = 'line' })<cr>",
			"prev diagnostic",
		},
		f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
		h = { vim.lsp.buf.hover, "Hover" },
		r = { vim.lsp.buf.rename, "Rename" },
		d = { vim.lsp.buf.definition, "Go to definition" },
		m = { vim.lsp.buf.implementation , "Go to implementation" },
	},
	g = {
		name = "Git",
		b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle git blame" },
		w = { "<cmd>Gitsigns toggle_word_diff<cr>", "Toggle word diff" },
	},
	["s"] = { "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"Telescope"
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
