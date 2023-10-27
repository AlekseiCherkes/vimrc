return {
    -- Essential
    {
        "williamboman/mason.nvim"
    },
    {
        'nvim-telescope/telescope.nvim', 
        versions = '0.1.x',
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
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
    -- TODO: stick to one of them  
    -- seems like the best due to a lot of optioins
    {
        "projekt0n/github-nvim-theme", 
        lazy = false,
        priority=1000,
        config = function ()
            vim.cmd([[colorscheme github_dark]])
        end
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

    -- Other
    "machakann/vim-highlightedyank",
    "wikitopian/hardmode",
    "chentoast/marks.nvim",
    "ojroques/nvim-osc52",
    "nvim-lua/plenary.nvim",
    {
        'ThePrimeagen/harpoon',
        lazy = true
    }
}

