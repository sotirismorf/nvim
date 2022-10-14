local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

local servers = {
	"ansiblels",
	"bashls",
	"cssls",
	"graphql",
	"html",
	"jdtls",
	"jsonls",
	"pylsp",
	"pyright",
	"rust_analyzer",
	"sqlls",
	"sumneko_lua",
	"svelte",
	"tailwindcss",
	"taplo",
	"tsserver",
}

for _, server in pairs(servers) do
	lspconfig[server].setup(opts)
end
