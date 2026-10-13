return {
	{
		"dont-be-evil-company/kulala.nvim",
		ft = { "http", "rest" },
		opts = {
			-- Keep custom keymaps below
			global_keymaps = false,

			-- HTTP request execution
			kulala_core = {
				timeout = 60000,
			},

			-- HTTP file environment
			default_env = "default",
			environment_scope = "b",
			vscode_rest_client_environmentvars = false,

			-- Format JSON responses
			response_format = {
				indent = 2,
				expand_tabs = true,
				sort_keys = false,
			},

			-- Response UI
			ui = {
				display_mode = "split",
				split_direction = "right",

				win_opts = {
					bo = {},
					wo = {
						foldenable = false,
						foldlevel = 99,
					},
				},

				default_view = "body",
				winbar = true,

				default_winbar_panes = {
					"body",
					"headers",
					"verbose",
					"script_output",
					"report",
				},

				-- default icons
				icons = {
					inlay = {
						loading = "⏳",
						done = "✔",
						error = "✘",
					},
					lualine = "🐼",
					textHighlight = "WarningMsg", -- highlight group for request elapsed time
					loadingHighlight = "Normal",
					doneHighlight = "String",
					errorHighlight = "ErrorMsg",
				},

				show_request_summary = true,
				show_variable_info_text = false,
				show_icons = "on_request",

				max_response_size = 32768,
				max_request_size = 2048,

				report = {
					show_script_output = true,
					show_asserts_output = true,
					show_summary = true,
				},
			},

			-- Built-in LSP
			lsp = {
				enable = true,
				filetypes = {
					"http",
					"rest",
					"javascript",
					"typescript",
					"lua",
				},
				enforce_external_script_naming_convention = true,
				keymaps = false,
			},

			-- UI and scripting feedback
			debug = 1,
			generate_bug_report = false,
			script_console_notify = true,
		},
		keys = {
			{
				"<leader>rs",
				function()
					require("kulala").run()
				end,
				ft = "http",
				desc = "Send request",
			},
			{
				"<leader>ra",
				function()
					require("kulala").run_all()
				end,
				ft = "http",
				desc = "Send all requests",
			},
			{
				"<leader>rr",
				function()
					require("kulala").replay()
				end,
				ft = "http",
				desc = "Replay last request",
			},
			{
				"]r",
				function()
					require("kulala").jump_next()
				end,
				ft = "http",
				desc = "Next request",
			},
			{
				"[r",
				function()
					require("kulala").jump_prev()
				end,
				ft = "http",
				desc = "Prev request",
			},
		},
	},
}
