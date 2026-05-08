return {
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v2.x',
        lazy = true,
        cmd = "Neotree",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        init = function()
            local exec = function(args)
                return function() require('neo-tree.command').execute(args) end
            end
            vim.keymap.set("n", "<leader>n", exec({ action = 'focus', source = 'filesystem', reveal = false }), { desc = "Neo-tree: filesystem" })
            vim.keymap.set("n", "<leader>r", exec({ action = 'focus', source = 'filesystem', reveal = true }),  { desc = "Neo-tree: reveal current file" })
            vim.keymap.set("n", "<leader>b", exec({ action = 'focus', source = 'buffers' }),                    { desc = "Neo-tree: buffers" })
            vim.keymap.set("n", "<leader>g", exec({ action = 'focus', source = 'git_status' }),                 { desc = "Neo-tree: git status" })
        end,
        config = function()
            require("neo-tree").setup({
                window = {
                    filesystem = {
                        use_libuv_file_watcher = true
                    },
                    source_selector = {
                        winbar = true
                    },
                    mappings = {
                        ["o"] = 'open',
                        ['/'] = 'noop',

                        -- remap '?' to g? like in vim-fugitive since I want to use it for navigation
                        ['?'] = 'noop',
                        ['g?'] = 'show_help'
                    }
                },
                filesystem = {
                    window = {
                        mappings = {
                            -- disable fuzzy finder
                            ['I'] = 'toggle_hidden',
                            ["/"] = "noop"
                        }
                    }
                }
            })
        end,
    }
}
