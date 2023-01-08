local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup {
	-- snippet = {
	-- 	expand = function(args)
	-- 		luasnip.lsp_expand(args.body) -- For `luasnip` users.
	-- 	end,
	-- },
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
		-- ["<C-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		-- ["<C-j>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-e>"] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},
		["<CR>"] = cmp.mapping.confirm { select = true },
	},
	formatting = {
		fields = { "abbr", "kind", "menu" },
	},
	sources = {
		{ name = "nvim_lsp" },
		-- { name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
	view = {
		entries = "native_menu"
	},
	window = {
		documentation = {
			border = "single"
		},
	},
}
