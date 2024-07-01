return {
	"kyazdani42/nvim-tree.lua",
	opts = {
		renderer = {
			highlight_opened_files = "name",
			root_folder_label = ":~",
			indent_markers = {
				enable = true,
			},
			icons = {
				show = {
					folder_arrow = false,
				},
			},
		},
		filters = {
			custom = {
				"_templ.go$",
				"_templ.txt$",
			}
		}
	},
}
