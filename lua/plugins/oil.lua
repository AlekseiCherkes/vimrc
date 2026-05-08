return {
    {
        'stevearc/oil.nvim',
        -- not lazy: needed to open directories passed on the command line (`nvim .`)
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("oil").setup({
                view_options = {
                    show_hidden = true,
                },
            })
            vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Oil: open parent directory" })
        end,
    }
}
