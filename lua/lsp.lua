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

local lspconfig = require("lspconfig")

for _, server in pairs(servers) do
	lspconfig[server].setup({})
end

require("lspconfig.ansible")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local null_ls = require("null-ls")
null_ls.setup {
	debug = false,
	sources = {
		null_ls.builtins.diagnostics.yamllint,
		-- null_ls.builtins.formatting.prettierd.with({ extra_args = { "--single-quote", "--jsx-single-quote" } }),
	},
}
