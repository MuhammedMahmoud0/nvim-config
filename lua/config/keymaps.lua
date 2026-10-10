-- Save all buffers
vim.keymap.set("n", "<C-s>", "<cmd>wall<CR>", {
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
