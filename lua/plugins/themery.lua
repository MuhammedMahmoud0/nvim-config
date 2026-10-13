return {
	{
		"zaldih/themery.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			themes = {
				-- catppuccin
				"catppuccin-mocha",
				"catppuccin-macchiato",
				"catppuccin-frappe",
				"catppuccin-latte",

				-- tokyonight
				"tokyonight-night",
				"tokyonight-storm",
				"tokyonight-moon",
				"tokyonight-day",

				-- rose-pine
				"rose-pine-main",
				"rose-pine-moon",
				"rose-pine-dawn",

				-- gruvbox (contrast set in `before`)
				{
					name = "Gruvbox Hard",
					colorscheme = "gruvbox",
					before = [[
						vim.o.background = "dark"
						require("gruvbox").setup({ contrast = "hard" })
					]],
				},
				{
					name = "Gruvbox Medium",
					colorscheme = "gruvbox",
					before = [[
						vim.o.background = "dark"
						require("gruvbox").setup({ contrast = "" })
					]],
				},
				{
					name = "Gruvbox Soft",
					colorscheme = "gruvbox",
					before = [[
						vim.o.background = "dark"
						require("gruvbox").setup({ contrast = "soft" })
					]],
				},
				{
					name = "Gruvbox Light",
					colorscheme = "gruvbox",
					before = [[
						vim.o.background = "light"
						require("gruvbox").setup({ contrast = "" })
					]],
				},
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
