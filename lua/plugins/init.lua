return {
    {
        "nvim-lua/plenary.nvim",
        lazy = true
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
        end,
        opts = { }
    },

    "tpope/vim-fugitive",
    "vim-airline/vim-airline",
    "vim-airline/vim-airline-themes",
    {
        "kylechui/nvim-surround",
        config = true
    },
}
