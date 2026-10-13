return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install({
				"lua",
				"vim",
				"vimdoc",
				"query",
				"bash",
				"json",
				"markdown",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css, http",
				"go",
			})
			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					pcall(vim.treesitter.start, args.buf)
				end,
			})
		end,
	},
}
