return {
	"hrsh7th/nvim-cmp",
	lazy = false,
	priority = 100,
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
	},
	config = function()
		-- https://github.com/tjdevries/config.nvim/blob/master/lua/custom/plugins/completion.lua
		-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip

		local cmp = require "cmp"
		local luasnip = require "luasnip"

		cmp.event:on(
			'confirm_done',
			require("nvim-autopairs.completion.cmp").on_confirm_done()
		)

		cmp.setup {
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			},
			mapping = {
				['<CR>']    = cmp.mapping(function(fallback)
					if cmp.visible() then
						if luasnip.expandable() then
							luasnip.expand()
						else
							cmp.confirm({
								select = true,
							})
						end
					else
						fallback()
					end
				end),
				["<Tab>"]   = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			},
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
		}
	end,
}
