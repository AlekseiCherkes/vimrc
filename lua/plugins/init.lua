return {
    -- Essential
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
    "neovim/nvim-lspconfig",
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
}
