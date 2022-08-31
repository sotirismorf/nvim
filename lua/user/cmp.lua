local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

require("luasnip/loaders/from_vscode").lazy_load()

--   פּ ﯟ   some other good icons
local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = {
		["<S-k>"] = cmp.mapping.select_prev_item(),
		["<S-j>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<C-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-j>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},
		["<CR>"] = cmp.mapping.confirm { select = true },
	},
	formatting = {
		fields = { "abbr", "kind", "menu" },
		format = function(entry, vim_item)
			-- Kind icons
			-- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			-- vim_item.menu = ({
			-- 	nvim_lsp = "[LSP]",
			-- 	luasnip = "[Snippet]",
			-- 	buffer = "[Buffer]",
			-- 	path = "[Path]",
			-- })[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
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
