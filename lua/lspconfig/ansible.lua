local lspconfig = require("lspconfig")

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ansiblels
lspconfig.ansiblels.setup {
	settings = {
		ansible = {
			ansible = {
				path = vim.env.HOME .. '/p/venv/ansible/bin/ansible',
			},
			validation = {
				lint = {
					path = vim.env.HOME .. '/p/venv/ansible/bin/ansible-lint',
				},
			},
		},
	},
	filetypes = { 'yaml' },
	root_dir = lspconfig.util.root_pattern('ansible.cfg', '.ansible-lint'),
	single_file_support = false,
}
