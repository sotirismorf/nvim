return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'williamboman/mason.nvim',
		'folke/neodev.nvim',
		'williamboman/mason-lspconfig.nvim',
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "b0o/SchemaStore.nvim" },

		{ 'j-hui/fidget.nvim',   opts = {} },
	},
	config = function()
		require("neodev").setup {}

		local capabilities = nil
		if pcall(require, "cmp_nvim_lsp") then
			capabilities = require("cmp_nvim_lsp").default_capabilities()
		end

		local lspconfig = require "lspconfig"

		local servers = {
			gopls = {
				settings = {
					gopls = {
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
					},
				},
			},
			lua_ls = {
				server_capabilities = {
					semanticTokensProvider = vim.NIL,
				},
			},
			-- html = true,
			ansiblels = true,
			bashls = true,
			cssls = true,
			dockerls = true,
			htmx = true,
			jsonls = true,
			pylsp = true,
			rust_analyzer = true,
			sqlls = true,
			svelte = true,
			tailwindcss = true,
			templ = true,
			tsserver = true,
			yamlls = true,
		}

		local servers_to_install = vim.tbl_filter(function(key)
			local t = servers[key]
			if type(t) == "table" then
				return not t.manual_install
			else
				return t
			end
		end, vim.tbl_keys(servers))

		require("mason").setup()

		local ensure_installed = {
			"stylua",
			"lua_ls",
			-- "tailwind-language-server",
		}
		vim.list_extend(ensure_installed, servers_to_install)
		require("mason-tool-installer").setup { ensure_installed = ensure_installed }

		for name, config in pairs(servers) do
			if config == true then
				config = {}
			end
			config = vim.tbl_deep_extend("force", {}, {
				capabilities = capabilities,
			}, config)

			lspconfig[name].setup(config)
		end

		require("mason-tool-installer").setup { ensure_installed = ensure_installed }
		local disable_semantic_tokens = {
			lua = true,
		}

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf
				local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

				local settings = servers[client.name]
				if type(settings) ~= "table" then
					settings = {}
				end

				local builtin = require "telescope.builtin"

				vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

				-- lsp
				vim.keymap.set("n", "<Leader>lf", vim.lsp.buf.format, { desc = "[f]ormat buffer" })
				vim.keymap.set("n", '<Leader>lh', vim.lsp.buf.hover, { desc = '[H]over Documentation' })
				vim.keymap.set("n", '<Leader>lS', vim.lsp.buf.signature_help, { desc = '[S]ignature documentation' })
				vim.keymap.set("n", '<Leader>la', vim.lsp.buf.code_action, { desc = 'Code [a]ction' })
				vim.keymap.set("n", '<Leader>ld', vim.lsp.buf.definition, { desc = 'Goto [d]efinition' })
				vim.keymap.set("n", '<Leader>le', vim.lsp.buf.declaration, { desc = 'Goto D[e]claration' })
				vim.keymap.set("n", '<Leader>lm', vim.lsp.buf.implementation, { desc = 'Goto I[m]plementation' })
				vim.keymap.set("n", '<Leader>lR', vim.lsp.buf.rename, { desc = '[r]ename' })
				vim.keymap.set("n", '<Leader>lt', vim.lsp.buf.type_definition, { desc = '[t]ype definition' })

				vim.keymap.set("n", '<Leader>lj', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
				vim.keymap.set("n", '<Leader>lk', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })

				-- telescope + lsp
				vim.keymap.set("n", '<Leader>lr', builtin.lsp_references, { desc = 'List [R]eferences' })

				local filetype = vim.bo[bufnr].filetype
				if disable_semantic_tokens[filetype] then
					client.server_capabilities.semanticTokensProvider = nil
				end

				-- Override server capabilities
				if settings.server_capabilities then
					for k, v in pairs(settings.server_capabilities) do
						if v == vim.NIL then
							---@diagnostic disable-next-line: cast-local-type
							v = nil
						end

						client.server_capabilities[k] = v
					end
				end
			end,
		})
	end
}
