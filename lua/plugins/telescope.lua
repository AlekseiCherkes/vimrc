return {
    {
        'nvim-telescope/telescope.nvim',
        lazy = true,
        versions = '0.1.x',
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        init = function()
            local bi = function()
                return require('telescope.builtin')
            end

            vim.keymap.set('n', '<leader>ff', function() bi().find_files() end, { desc = "Find files" })
            vim.keymap.set('n', '<leader>fg', function() bi().live_grep() end, { desc = "Live grep" })
            vim.keymap.set('n', '<leader>fb', function() bi().buffers() end, { desc = "Buffers" })
            vim.keymap.set('n', '<leader>fh', function() bi().help_tags() end, { desc = "Help tags" })

            -- My ones
            vim.keymap.set('n', '<leader>fj', function()
                require("telescope").load_extension('harpoon')
                vim.cmd('Telescope harpoon marks')
            end, { desc = "Harpoon marks" })
        end
    }
}
