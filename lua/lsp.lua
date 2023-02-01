require("mason").setup()

local mason_lspconfig = require 'mason-lspconfig'

local servers = {
	"ansiblels",
	"bashls",
	"cssls",
	"dockerls",
	"html",
	"jsonls",
	"pylsp",
	"rust_analyzer",
	"sqlls",
	"sumneko_lua",
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
		null_ls.builtins.diagnostics.yamllint.with {
			extra_args = { "-c", vim.env.HOME .. '/.config/nvim/lua/lspconfig/yamllint.yml' }
		},
		-- null_ls.builtins.formatting.prettierd.with({ extra_args = { "--single-quote", "--jsx-single-quote" } }),
	},
}
