require("mason").setup()

local mason_lspconfig = require 'mason-lspconfig'

local servers = {
	"ansiblels",
	"bashls",
	"cssls",
	"dockerls",
	"html",
	"jsonls",
	"lua_ls",
	"pylsp",
	"rust_analyzer",
	"sqlls",
	"svelte",
	"tailwindcss",
	"tsserver",
	"yamlls",
}

mason_lspconfig.setup {
	ensure_installed = servers
}

require("neodev").setup()

local lspconfig = require("lspconfig")

for _, server in pairs(servers) do
	lspconfig[server].setup({})
end

require("lspconfig.ansible")

require('lspconfig').yamlls.setup {
	settings = {
		yaml = {
			schemas = {
				["http://json.schemastore.org/kustomization"] = "kustomization.yaml",
				-- ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.yml",
				-- ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "*.yml",
			},
		},
	}
}

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
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

-- -- [[ Configure LSP ]]
-- --  This function gets run when an LSP connects to a particular buffer.
-- local on_attach = function(_, bufnr)
--   -- NOTE: Remember that lua is a real programming language, and as such it is possible
--   -- to define small helper and utility functions so you don't have to repeat yourself
--   -- many times.
--   --
--   -- In this case, we create a function that lets us more easily define mappings specific
--   -- for LSP related items. It sets the mode, buffer and description for us each time.
--   local nmap = function(keys, func, desc)
--     if desc then
--       desc = 'LSP: ' .. desc
--     end
--
--     vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
--   end
--
--   nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
--   nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
--
--   nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
--   nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
--   nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
--   nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
--   nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
--   nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
--
--   -- See `:help K` for why this keymap
--   nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
--   nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
--
--   -- Lesser used LSP functionality
--   nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
--   nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
--   nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
--   nmap('<leader>wl', function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--   end, '[W]orkspace [L]ist Folders')
--
--   -- Create a command `:Format` local to the LSP buffer
--   vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
--     vim.lsp.buf.format()
--   end, { desc = 'Format current buffer with LSP' })
-- end
--
-- -- Enable the following language servers
-- --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
-- --
-- --  Add any additional override configuration in the following tables. They will be passed to
-- --  the `settings` field of the server config. You must look up that documentation yourself.
--
-- local servers = {
-- 	ansiblels = {
-- 		settings = {
-- 			ansible = {
-- 				python = {
-- 					interpreterPath = '/home/sotiris/p/venv/ansible-lint/bin/python3',
-- 				},
-- 				ansible = {
-- 					path = '/home/sotiris/p/venv/ansible-2.9/bin/ansible',
-- 				},
-- 				executionEnvironment = {
-- 					enabled = false,
-- 				},
-- 				validation = {
-- 					enabled = true,
-- 					lint = {
-- 						enabled = true,
-- 						path = '/home/sotiris/p/venv/ansible-lint/bin/ansible-lint',
-- 					},
-- 				},
-- 			},
-- 		},
-- 		filetypes = { 'yaml' },
-- 		-- root_dir = require('lspconfig').util.root_pattern('ansible.cfg', '.ansible-lint'),
-- 		single_file_support = true,
-- 	},
-- 	-- "bashls",
-- 	-- "cssls",
-- 	-- "dockerls",
-- 	-- "html",
-- 	-- "jsonls",
-- 	-- "lua_ls",
-- 	-- "pylsp",
-- 	-- "rust_analyzer",
-- 	-- "sqlls",
-- 	-- "svelte",
-- 	-- "tailwindcss",
-- 	-- "tsserver",
-- 	yamlls = {},
-- }
--
-- -- local servers = {
-- --   -- clangd = {},
-- --   -- gopls = {},
-- --   -- pyright = {},
-- --   -- rust_analyzer = {},
-- --   -- tsserver = {},
-- --
-- --   lua_ls = {
-- --     Lua = {
-- --       workspace = { checkThirdParty = false },
-- --       telemetry = { enable = false },
-- --     },
-- --   },
-- -- }
--
-- -- Setup neovim lua configuration
-- require('neodev').setup()
--
-- -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
--
-- -- Ensure the servers above are installed
-- local mason_lspconfig = require 'mason-lspconfig'
--
-- mason_lspconfig.setup {
--   ensure_installed = vim.tbl_keys(servers),
-- }
--
-- mason_lspconfig.setup_handlers {
--   function(server_name)
--     require('lspconfig')[server_name].setup {
--       capabilities = capabilities,
--       on_attach = on_attach,
--       settings = servers[server_name],
--     }
--   end,
-- }
