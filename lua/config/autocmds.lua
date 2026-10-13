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
