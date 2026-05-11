return {
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        lazy = true,
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("harpoon"):setup()
        end,
        init = function()
            vim.keymap.set("n", "<leader>a", function() require("harpoon"):list():add() end, { desc = "Harpoon: add file" })
            vim.keymap.set("n", "<C-e>", function()
                local h = require("harpoon")
                h.ui:toggle_quick_menu(h:list())
            end, { desc = "Harpoon: quick menu" })

            vim.keymap.set("n", "<C-h>", function() require("harpoon"):list():select(1) end, { desc = "Harpoon: file 1" })
            vim.keymap.set("n", "<C-t>", function() require("harpoon"):list():select(2) end, { desc = "Harpoon: file 2" })
            vim.keymap.set("n", "<C-n>", function() require("harpoon"):list():select(3) end, { desc = "Harpoon: file 3" })
            vim.keymap.set("n", "<C-s>", function() require("harpoon"):list():select(4) end, { desc = "Harpoon: file 4" })
        end,
    }
}
