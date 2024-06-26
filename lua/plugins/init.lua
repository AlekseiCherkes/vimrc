return {
    {
        "nvim-lua/plenary.nvim",
        lazy = true
    },
    -- Essential
    {
        "williamboman/mason.nvim"
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v2.x',
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
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
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",

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
    "lewis6991/gitsigns.nvim",
    "vim-airline/vim-airline",
    "vim-airline/vim-airline-themes",
    {
        "kylechui/nvim-surround",
        config = true
    },

    -- Plugin development
    {
        'folke/neodev.nvim'
    },

    -- Other
    'wikitopian/hardmode',
    'chentoast/marks.nvim',
}

