return {
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
        },
        opts = {
            ensure_installed = {
                "gopls",
                "ts_ls",
                "lua_ls",
                "emmet_language_server",
                "html",
                "cssls"
            },
--             ensure_installed = {
--                 "lua_ls", "pyright", "ruff", "html", "cssls", "ts_ls",
--                 "gopls", "clangd", "dockerls", "emmet_language_server", "texlab",
--             },
        },
        config = function(_, opts)
        -- applies to every server
        vim.lsp.config("*", {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    diagnostics = { globals = { "vim" } },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                       checkThirdParty = false,
                    },
                    telemetry = { enable = false },
                },
            },
        })

        vim.lsp.config("emmet_language_server", {
            filetypes = {
                "css", "eruby", "html", "javascript", "javascriptreact",
                "less", "sass", "scss", "pug", "typescriptreact",
            },
            init_options = {
                showAbbreviationSuggestions = true,
                showExpandedAbbreviation = "always",
                showSuggestionsAsSnippets = false,
            },
        })

        vim.diagnostic.config({
                virtual_text = true,
                severity_sort = true,
                float = { border = "rounded" },
            })


--         vim.lsp.config("texlab", {
--             settings = {
--                 texlab = {
--                     build = {
--                         executable = "latexmk",
--                         args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
--                         onSave = true,
--                     },
--                     forwardSearch = {
--                         executable = "zathura",
--                         args = { "--synctex-forward", "%l:1:%f", "%p" },
--                     },
--                     chktex = { onOpenAndSave = true, onEdit = false },
--                     diagnosticsDelay = 300,
--                     formatterLineLength = 80,
--                         latexindent = { modifyLineBreaks = true },
--                 },
--             },
--         })
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(ev)
                    local function map(mode, lhs, rhs, desc)
                        vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
                    end

                    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
                    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code actions")
                    map("n", "<leader>gr", vim.lsp.buf.references, "References")
                    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
                    map("n", "<leader>dd", vim.diagnostic.open_float, "Show diagnostic")
                end,
            })


        -- mason-lspconfig auto-enables every installed server
        require("mason-lspconfig").setup(opts)
        end,
    },

--     {
--         "neovim/nvim-lspconfig",
--         keys = {
--             { "K", vim.lsp.buf.hover, desc = "Show hover information" },
--             { "gd", vim.lsp.buf.definition, desc = "Go to definition" },
--             { "<leader>ca", vim.lsp.buf.code_action, mode = { "n", "v" }, desc = "Code actions" },
--             { "<leader>gr", vim.lsp.buf.references, desc = "Show references" },
--         },
--     },
}
