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

            vim.keymap.set('n', '<leader>ff', function() bi().find_files() end, {})
            vim.keymap.set('n', '<leader>fg', function() bi().live_grep() end, {})
            vim.keymap.set('n', '<leader>fb', function() bi().buffers() end, {})
            vim.keymap.set('n', '<leader>fh', function() bi().help_tags() end, {})

            -- My ones
            vim.keymap.set('n', '<leader>fj', function() 
                require("telescope").load_extension('harpoon')
                vim.cmd('Telescope harpoon marks') 
            end, {})
        end
    }
}

