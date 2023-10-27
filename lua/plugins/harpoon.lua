return {
    {
        'ThePrimeagen/harpoon',
        lazy = true,
        init = function()
            vim.keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end)
            vim.keymap.set("n", "<C-e>", function() require('harpoon.ui').toggle_quick_menu() end)

            vim.keymap.set("n", "<C-h>", function() require('harpoon.ui').nav_file(1) end)
            vim.keymap.set("n", "<C-t>", function() require('harpoon.ui').nav_file(2) end)
            vim.keymap.set("n", "<C-n>", function() require('harpoon.ui').nav_file(3) end)
            vim.keymap.set("n", "<C-s>", function() require('harpoon.ui').nav_file(4) end)
        end
    }
}

