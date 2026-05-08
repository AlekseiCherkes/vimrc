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

    -- Colorthemes
    {
        "projekt0n/github-nvim-theme",
        lazy = false,
        priority=1000,
    },
    {
        "morhetz/gruvbox",
        lazy = true,
    },
    {
        "embark-theme/vim",
        lazy = true,
    },
    {
        "rose-pine/neovim",
        lazy = true,
    },

    -- Other 2
    "tpope/vim-fugitive",
    "vim-airline/vim-airline",
    "vim-airline/vim-airline-themes",
    {
        "kylechui/nvim-surround",
        config = true
    },

    -- Other
    'wikitopian/hardmode',
}
