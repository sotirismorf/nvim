require("mason").setup()

require("mason-lspconfig").setup {
	ensure_installed = {
		"ansiblels",
		"bashls",
		"html",
		"sumneko_lua",
	},
}

local servers = {
	"ansiblels",
	"bashls",
	"cssls",
	"graphql",
	"html",
	"jdtls",
	"jsonls",
	"yamlls",
	"pylsp",
	"pyright",
	"rust_analyzer",
	"sqlls",
	"sumneko_lua",
	"svelte",
	-- "tailwindcss",
	"taplo",
	"tsserver",
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
