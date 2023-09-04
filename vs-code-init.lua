--
-- Neovim specific settings for VSCode
--

vim.cmd("source ~/work/vimrc/vs-code-vimrc")

--
-- Intall Lazy.nvim
--

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--branch=stable", -- latest stable release
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

--
-- Plugins spec
--

require("lazy").setup(
    {
        {
            "kylechui/nvim-surround",
            config = true
        },
        "machakann/vim-highlightedyank"
    }
)

print("OK")

