return {
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
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
        end,
        config = function()
            require("neo-tree").setup({
                source_selector = {
                    winbar = true,
                },
                window = {
                    mappings = {
                        ["o"] = 'open',
                        ['/'] = 'noop',
                        -- free '?' for navigation, move help to g?
                        ['?'] = 'noop',
                        ['g?'] = 'show_help',

                        -- Move the "order by" sub-menu from default 'o' prefix to 'O'
                        -- so plain 'o' (open) fires without waiting for timeoutlen.
                        ["oc"] = "none",
                        ["od"] = "none",
                        ["og"] = "none",
                        ["om"] = "none",
                        ["on"] = "none",
                        ["os"] = "none",
                        ["ot"] = "none",
                        ["O"]  = { "show_help", config = { title = "Order by", prefix_key = "O" } },
                        ["Oc"] = "order_by_created",
                        ["Od"] = "order_by_diagnostics",
                        ["Og"] = "order_by_git_status",
                        ["Om"] = "order_by_modified",
                        ["On"] = "order_by_name",
                        ["Os"] = "order_by_size",
                        ["Ot"] = "order_by_type",
                    },
                },
                filesystem = {
                    use_libuv_file_watcher = true,
                    window = {
                        mappings = {
                            -- disable fuzzy finder
                            ['I'] = 'toggle_hidden',
                            ["/"] = "noop",
                        },
                    },
                },
            })
        end,
    },
}
