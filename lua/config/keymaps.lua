-- Save all buffers
vim.keymap.set({ "n", "i" }, "<C-s>", "<cmd>wall<CR>", {
	desc = "Save all buffers",
})

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', {
	desc = "Yank to system clipboard",
})

vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y', {
	desc = "Yank line to system clipboard",
})

-- Delete to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", '"+d', {
	desc = "Delete to system clipboard",
})

vim.keymap.set({ "n", "v" }, "<leader>D", '"+D', {
	desc = "Delete to system clipboard to end of line",
})

-- Paste from system clipboard
vim.keymap.set("n", "<leader>p", '"+p', {
	desc = "Paste after cursor from system clipboard",
})

vim.keymap.set("n", "<leader>P", '"+P', {
	desc = "Paste before cursor from system clipboard",
})

-- Window navigation (works without tmux)
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Window navigation: cycle through splits in a loop (works without tmux)
vim.keymap.set("n", "<C-l>", "<C-w>w", { desc = "Next window (wraps around)" })
vim.keymap.set("n", "<C-h>", "<C-w>W", { desc = "Previous window (wraps around)" })

-- Up/down stay directional
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
