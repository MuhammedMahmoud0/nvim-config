return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            preset = "modern", -- أو "classic" أو "helix"
            delay = 300, -- المدة بالمللي ثانية قبل ظهور القايمة
            spec = {
                { "<leader>f", group = "Find (Telescope)" },
                { "<leader>c", group = "Code" },
                { "<leader>g", group = "Git / LSP" },
                { "<leader>h", group = "Git hunks" },
                { "<leader>u", group = "UI" },
            },
        },
        keys = {
            {
                "<leader>?",
                function()
                require("which-key").show({ global = false })
                end,
                desc = "Buffer local keymaps",
            },
        },
    },
}
