return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            indent = { char = "│" },
            scope = { enabled = true },
        },
    },
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        opts = {},
    },
    {
        "folke/todo-comments.nvim",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        keys = {
            { "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Find TODOs" },
        },
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        opts = {},
    },
}
