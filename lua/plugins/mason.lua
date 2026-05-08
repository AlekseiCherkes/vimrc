return {
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonUninstall", "MasonLog" },
        config = function()
            require("mason").setup()
        end,
    }
}
