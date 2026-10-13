return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			preset = "modern",
			delay = 300,
			spec = {
				{ "<leader>f", group = "Find (Telescope)" },
				{ "<leader>c", group = "Code" },
				{ "<leader>g", group = "Git / LSP" },
				{ "<leader>h", group = "Git hunks" },
				{ "<leader>u", group = "UI" },
				{ "<leader>r", group = "REST" },
				{ "<leader>t", group = "Terminal" },
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer local keymaps",
			},
		},
	},
}
