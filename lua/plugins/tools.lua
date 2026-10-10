return {
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            ensure_installed = {
                "stylua",
                "prettier",
                "goimports",
--                 "black",
--                 "isort",
--                 "clang-format",
                "eslint_d",
                "golangci-lint",
--                 "cppcheck",
            },
        },
    },
}
