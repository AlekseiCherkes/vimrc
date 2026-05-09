return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
        end,
        opts = {
            spec = {
                { "<leader>f", group = "find (telescope)" },
                { "<leader>g", group = "git hunks" },
                { "<leader>c", group = "lsp code" },
                { "<leader>w", group = "lsp workspace" },
                { "<leader>t", group = "toggle" },
                { "<leader>p", group = "project" },
            },
        },
    }
}
