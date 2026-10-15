local kulala_group = vim.api.nvim_create_augroup("KulalaFolding", {
    clear = true,
})

vim.api.nvim_create_autocmd({ "FileType", "BufWinEnter" }, {
    group = kulala_group,
    pattern = "kulala_ui",
    callback = function()
    vim.schedule(function()
    if vim.bo.filetype == "kulala_ui" then
        vim.opt_local.foldlevel = 99
        vim.opt_local.foldenable = false
        end
        end)
    end,
})

-- vim.api.nvim_create_autocmd("ColorScheme", {
--     callback = function()
--     vim.api.nvim_set_hl(0, "@string.escape", { link = "Special" })
--     vim.api.nvim_set_hl(0, "@character.printf", { link = "Special" })
--     end,
-- })

-- Let treesitter colors (format verbs, escapes) show through inside strings.
-- gopls semantic tokens would otherwise repaint the whole string at higher priority.
local function fix_string_highlights()
vim.api.nvim_set_hl(0, "@lsp.type.string", {})
vim.api.nvim_set_hl(0, "@lsp.type.string.go", {})
vim.api.nvim_set_hl(0, "@string.escape", { link = "Special" })
vim.api.nvim_set_hl(0, "@character.printf", { link = "Special" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = fix_string_highlights,
})

fix_string_highlights()
