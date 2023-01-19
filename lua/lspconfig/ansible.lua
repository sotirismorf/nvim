local lspconfig = require("lspconfig")

lspconfig.ansiblels.setup {
	settings = {
		ansible = {
			python = {
				interpreterPath = '/home/sotiris/p/virtenvs/ansible-2.9/bin/python3',
			},
			ansible = {
				path = '/home/sotiris/p/virtenvs/ansible-2.9/bin/ansible',
			},
			executionEnvironment = {
				enabled = false,
			},
			validation = {
				enabled = true,
				lint = {
					enabled = true,
					path = '/home/sotiris/p/virtenvs/ansible-2.9/bin/ansible-lint',
				},
			},
		},
	},
	filetypes = { 'yaml' },
	root_dir = lspconfig.util.root_pattern('ansible.cfg', '.ansible-lint'),
	single_file_support = false,
}
