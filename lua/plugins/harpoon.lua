return {
    {
        'ThePrimeagen/harpoon',
        lazy = true,
        init = function()
            vim.keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end, { desc = "Harpoon: add file" })
            vim.keymap.set("n", "<C-e>", function() require('harpoon.ui').toggle_quick_menu() end, { desc = "Harpoon: quick menu" })

            vim.keymap.set("n", "<C-h>", function() require('harpoon.ui').nav_file(1) end, { desc = "Harpoon: file 1" })
            vim.keymap.set("n", "<C-t>", function() require('harpoon.ui').nav_file(2) end, { desc = "Harpoon: file 2" })
            vim.keymap.set("n", "<C-n>", function() require('harpoon.ui').nav_file(3) end, { desc = "Harpoon: file 3" })
            vim.keymap.set("n", "<C-s>", function() require('harpoon.ui').nav_file(4) end, { desc = "Harpoon: file 4" })
        end
    }
}

