return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>gf", -- نفس المفتاح القديم
                function()
                require("conform").format({ async = true, lsp_format = "fallback" })
                end,
                mode = { "n", "v" },
                desc = "Format buffer",
            },
        },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
--                 python = { "isort", "black" },
                javascript = { "prettier" },
                javascriptreact = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                scss = { "prettier" },
                json = { "prettier" },
                markdown = { "prettier" },
--                 c = { "clang-format" },
--                 cpp = { "clang-format" },
                go = { "goimports", "gofmt" },
                -- tex = { "latexindent" },
            },
            format_on_save = {
                timeout_ms = 1000,
                lsp_format = "fallback",
            },
        },
    },
}
