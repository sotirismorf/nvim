return { "nvim-lualine/lualine.nvim",
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = '', right = ''},
			disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
			always_divide_middle = true,
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = {},
	},
}
