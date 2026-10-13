return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{
				"<leader>e",
				-- "<leader>n",
				"<cmd>Neotree toggle<CR>",
				desc = "Toggle Neo-tree",
			},
			{
				"<leader>o",
				"<cmd>Neotree focus<CR>",
				desc = "Focus Neo-tree",
			},
		},
		opts = {
			close_if_last_window = true,

			filesystem = {
				follow_current_file = {
					enabled = true,
					leave_dirs_open = false,
				},
				use_libuv_file_watcher = true,

				window = {
					mappings = {
						["Z"] = "expand_all_nodes",
						["Y"] = {
							function(state)
								local node = state.tree:get_node()
								if node then
									vim.fn.setreg("+", node:get_id(), "c")
								end
							end,
							desc = "Copy path to clipboard",
						},
					},
				},
			},

			default_component_configs = {
				indent = {
					with_expanders = true,
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
				git_status = {
					symbols = {
						-- Change type
						added = "✚", -- NOTE: you can set any of these to an empty string to not show them
						deleted = "✖",
						modified = "",
						renamed = "",
						-- Status type
						untracked = "",
						ignored = "",
						unstaged = "",
						staged = "",
						conflict = "",
					},
					align = "right",
				},
			},
		},
	},
}
