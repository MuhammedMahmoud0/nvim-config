return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "auto",
				globalstatus = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = { "dashboard", "alpha" },
				},
			},

			sections = {
				-- Left
				lualine_a = { { "mode", icon = "" } },
				lualine_b = {
					{ "branch", icon = "" },
					{ "diff", symbols = { added = " ", modified = " ", removed = " " } },
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
					},
				},

				-- Middle
				lualine_c = {
					{ "filename", path = 1, symbols = { modified = " ", readonly = " 🔒" } },
				},

				-- Right
				lualine_x = {
					{ "encoding" },
					{ "fileformat", icons_enabled = true },
					{ "filetype", icon_only = false },
				},
				lualine_y = {
					{ "progress", separator = "" },
				},
				lualine_z = {
					{ "location", icon = "" },
				},
			},

			inactive_sections = {
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "location" },
			},

			extensions = { "neo-tree", "quickfix", "man", "lazy", "mason" },
		},
	},
}
