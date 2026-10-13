return {
	{
		"christoomey/vim-tmux-navigator",

		cond = function()
			return vim.env.TMUX ~= nil
		end,

		init = function()
			-- stop the plugin from taking <C-\> (and defining its own maps)
			vim.g.tmux_navigator_no_mappings = 1
		end,

		cmd = { "TmuxNavigateLeft", "TmuxNavigateDown", "TmuxNavigateUp", "TmuxNavigateRight" },
		keys = {
			{ "<C-h>", "<cmd>TmuxNavigateLeft<CR>" },
			{ "<C-j>", "<cmd>TmuxNavigateDown<CR>" },
			{ "<C-k>", "<cmd>TmuxNavigateUp<CR>" },
			{ "<C-l>", "<cmd>TmuxNavigateRight<CR>" },
		},
	},
}
