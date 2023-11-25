return
{
	"nvim-neorg/neorg",
	build = ":Neorg sync-parsers",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("neorg").setup {
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.summary"] = {},
				["core.promo"] = {},
				-- ["core.keybinds"] = {
				-- 	-- Defaults: https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
				-- 	-- How to setup user keybinds: https://github.com/nvim-neorg/neorg/wiki/User-Keybinds
				-- 	config = {
				-- 		hook = function(keybinds)
				-- 			keybinds.map("norg", "n", "<leader>ni", "<cmd>Neorg index<CR>")
				-- 		end,
				-- 	}
				-- },
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "~/p/repos/git/notes",
						},
					},
				},
			},
		}
	end,
}
