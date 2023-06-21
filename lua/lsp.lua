local on_attach = function(_, bufnr)
	-- we create a function that lets us more easily define mappings specific
	-- for LSP related items. It sets the mode, buffer and description for us each time.
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	-- lsp
	nmap('<Leader>lD', vim.lsp.buf.hover, 'Hover [D]ocumentation')
	nmap('<Leader>lS', vim.lsp.buf.signature_help, '[S]ignature documentation')
	nmap('<Leader>la', vim.lsp.buf.code_action, 'Code [a]ction')
	nmap('<Leader>ld', vim.lsp.buf.definition, 'Goto [d]efinition')
	nmap('<Leader>le', vim.lsp.buf.declaration, 'Goto D[e]claration')
	nmap('<Leader>lf', vim.lsp.buf.format, '[f]ormat buffer')
	nmap('<Leader>li', vim.lsp.buf.implementation, 'Goto [i]mplementation')
	nmap('<Leader>lr', vim.lsp.buf.rename, '[r]ename')
	nmap('<Leader>lt', vim.lsp.buf.type_definition, '[t]ype definition')

	-- diagnostics
	nmap('<Leader>lj', vim.diagnostic.goto_next, 'Next diagnostic')

	-- telescope + lsp
	nmap('<Leader>lR', require('telescope.builtin').lsp_references, 'List [R]eferences')
	nmap('<Leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
	nmap('<Leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

	-- workspaces
	nmap('<Leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	nmap('<Leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	nmap('<Leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, '[W]orkspace [L]ist Folders')
end

local servers = {
	ansiblels = {},
	bashls = {},
	cssls = {},
	dockerls = {},
	html = {},
	jsonls = {},
	lua_ls = {},
	pylsp = {},
	rust_analyzer = {},
	sqlls = {},
	svelte = {},
	tailwindcss = {},
	tsserver = {},
	yamlls = {},
}

require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
	ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
	function(server_name)
		require('lspconfig')[server_name].setup {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
		}
	end,
}

require("lspconfig.ansible")

-- -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local null_ls = require("null-ls")
null_ls.setup {
	debug = false,
	sources = {
		null_ls.builtins.diagnostics.markdownlint,
		null_ls.builtins.diagnostics.yamllint.with {
			extra_args = { "-c", vim.env.HOME .. '/.config/nvim/lua/lspconfig/yamllint.yml' }
		},
		null_ls.builtins.formatting.yamlfmt.with {
			extra_args = { "--conf", vim.env.HOME .. '/.config/nvim/lua/lspconfig/yamlfmt.yml' }
		}
		-- null_ls.builtins.formatting.prettierd.with({ extra_args = { "--single-quote", "--jsx-single-quote" } }),
	},
}
