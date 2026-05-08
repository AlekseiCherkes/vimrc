--
-- Neovim specific settings
--

vim.cmd("source ~/.vimrc")

--
-- Disable some default providers
--

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

--
-- Persistent undo across sessions
--

vim.opt.undofile = true

--
-- Intall Lazy.nvim
--

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
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

require("lazy").setup("plugins")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Project view (netrw)" })

