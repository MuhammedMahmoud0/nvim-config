return {
	{
		"zaldih/themery.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			themes = {
				"catppuccin-mocha",
				"catppuccin-macchiato",
				"catppuccin-latte",
				"catppuccin-frappe",
				"gruvbox",
				"rose-pine",
				"tokyonight",
			},
			livePreview = true,
			persistence = true,
		},
		keys = {
			{
				"<leader>ut",
				"<cmd>Themery<CR>",
				desc = "Choose colorscheme",
			},
		},
	},
}
