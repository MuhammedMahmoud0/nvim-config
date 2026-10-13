-- return {
--     {
--         "catppuccin/nvim",
--         name = "catppuccin",
--         priority = 1000,
--         lazy = false,
--         opts = {
--             flavour = "mocha",
--             term_colors = true,
--             transparent_background = false,
--             integrations = {
--                 neotree = true,
--             },
--         },
--         config = function(_, opts)
--         require("catppuccin").setup(opts)
--         vim.cmd.colorscheme("catppuccin")
--         end,
--     },
-- }

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",
			auto_integrations = false,
			term_colors = true,
			transparent_background = false,
			-- integrations = {
			-- neotree = true,
			-- },
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "macchiato",
			auto_integrations = false,
			term_colors = true,
			transparent_background = false,
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "latte",
			auto_integrations = false,
			term_colors = true,
			transparent_background = false,
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "frappe",
			auto_integrations = false,
			term_colors = true,
			transparent_background = false,
		},
	},
	{
		"ellisonleao/gruvbox.nvim",
		opts = {
			contrast = "hard",
		},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			variant = "main",
		},
	},
	{
		"folke/tokyonight.nvim",
		opts = {
			style = "night",
		},
	},
}
