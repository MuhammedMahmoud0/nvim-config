-- return {
-- 	{
-- 		"akinsho/toggleterm.nvim",
-- 		version = "*",
-- 		-- only outside tmux (inside tmux, use tmux panes instead)
-- 		cond = function()
-- 			return vim.env.TMUX == nil
-- 		end,
-- 		event = "VeryLazy",
-- 		opts = {
-- 			size = 15,
-- 			direction = "horizontal",
-- 			shade_terminals = false,
-- 			float_opts = { border = "rounded" },
--
-- 			-- <C-\> toggles terminal 1, 2<C-\> toggles terminal 2, etc.
-- 			open_mapping = [[<C-\>]],
--
-- 			-- tab-like bar showing the terminals
-- 			winbar = {
-- 				enabled = true,
-- 				name_formatter = function(term)
-- 					return term.id .. ": " .. (term.name or "term")
-- 				end,
-- 			},
-- 		},
-- 		keys = {
-- 			{ "<leader>tn", "<cmd>ToggleTermSetName<CR>", desc = "Rename terminal" },
-- 			{ "<leader>ts", "<cmd>TermSelect<CR>", desc = "Select terminal" },
-- 			{ "<leader>ta", "<cmd>ToggleTermToggleAll<CR>", desc = "Toggle all terminals" },
-- 			{ "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", desc = "Floating terminal" },
-- 		},
-- 	},
-- }

return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		-- only outside tmux (inside tmux use tmux panes instead)
		cond = function()
			return vim.env.TMUX == nil
		end,
		event = "VeryLazy",
		config = function()
			local Terminal = require("toggleterm.terminal").Terminal

			require("toggleterm").setup({
				size = 15,
				direction = "horizontal",
				shade_terminals = false,
				float_opts = { border = "rounded" },
			})

			local terms = {}
			local current = 0

			-- tab bar colors follow the active colorscheme
			local function set_hl()
				vim.api.nvim_set_hl(0, "TermTabSel", { link = "TabLineSel" })
				vim.api.nvim_set_hl(0, "TermTab", { link = "TabLine" })
				vim.api.nvim_set_hl(0, "TermTabFill", { link = "TabLineFill" })
			end
			set_hl()
			vim.api.nvim_create_autocmd("ColorScheme", { callback = set_hl })

			-- Tab bar content. Each tab is wrapped in %<id>@v:lua.TermTabClick@ ... %X
			-- so a mouse click calls TermTabClick(id, ...). The "+" button uses
			-- id = #terms + 1, which TermTabClick treats as "new terminal".
			function _G.TermTabs()
				local out = {}
				for i = 1, #terms do
					local group = (i == current) and "TermTabSel" or "TermTab"
					out[#out + 1] = string.format("%%#%s#%%%d@v:lua.TermTabClick@  %d  %%X", group, i, i)
				end
				out[#out + 1] = string.format("%%#TermTab#%%%d@v:lua.TermTabClick@  +  %%X", #terms + 1)
				out[#out + 1] = "%#TermTabFill#"
				return table.concat(out)
			end

			local function close_all()
				for _, t in ipairs(terms) do
					if t:is_open() then
						t:close()
					end
				end
			end

			local function is_any_open()
				for _, t in ipairs(terms) do
					if t:is_open() then
						return true
					end
				end
				return false
			end

			-- show terminal i (hides the others, so no stacked splits)
			local function show(i)
				close_all()
				current = i
				local t = terms[i]
				t:open()
				if t.window and vim.api.nvim_win_is_valid(t.window) then
					vim.wo[t.window].winbar = "%{%v:lua.TermTabs()%}"
				end
			end

			local function new()
				terms[#terms + 1] = Terminal:new({ hidden = true, direction = "horizontal" })
				show(#terms)
			end

			local function toggle()
				if is_any_open() then
					close_all()
				elseif #terms == 0 then
					new()
				else
					show(current)
				end
			end

			local function cycle(step)
				if #terms == 0 then
					return new()
				end
				if not is_any_open() then
					return show(current)
				end
				show((current - 1 + step) % #terms + 1)
			end

			-- close terminal i: kills its shell, removes its tab, shows a neighbor
			local function close(i)
				local t = table.remove(terms, i)
				if not t then
					return
				end
				t:shutdown()

				if #terms == 0 then
					current = 0
					return
				end

				if i < current then
					current = current - 1
				elseif i == current then
					current = math.min(current, #terms)
				end
				show(current)
			end

			-- left click: switch (or "+" = new), middle click: close that tab
			function _G.TermTabClick(id, _, button, _)
				if button == "l" then
					if id > #terms then
						new()
					else
						show(id)
					end
				elseif button == "m" and id <= #terms then
					close(id)
				end
			end
			-- direct keys (work from normal mode and terminal mode)
			vim.keymap.set({ "n", "t" }, "<C-\\>", toggle, { desc = "Toggle terminal" })
			vim.keymap.set({ "n", "t" }, "<A-n>", new, { desc = "New terminal" })
			vim.keymap.set({ "n", "t" }, "<C-PageDown>", function()
				cycle(1)
			end, { desc = "Next terminal" })
			vim.keymap.set({ "n", "t" }, "<C-PageUp>", function()
				cycle(-1)
			end, { desc = "Previous terminal" })

			-- leader versions (visible in which-key, normal mode only)
			vim.keymap.set("n", "<leader>tt", toggle, { desc = "Toggle terminal" })
			vim.keymap.set("n", "<leader>tn", new, { desc = "New terminal" })
			vim.keymap.set("n", "<leader>tl", function()
				cycle(1)
			end, { desc = "Next terminal" })
			vim.keymap.set("n", "<leader>th", function()
				cycle(-1)
			end, { desc = "Previous terminal" })
			vim.keymap.set("n", "<leader>tx", function()
				close(current)
			end, { desc = "Close terminal" })

			vim.api.nvim_create_user_command("TermClose", function()
				close(current)
			end, { desc = "Close current terminal" })
		end,
	},
}
