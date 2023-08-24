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

plugins = {
    -- TODO: stick to one of them  
    "folke/tokyonight.nvim",
    "morhetz/gruvbox",
    "projekt0n/github-nvim-theme", -- seems like the best due to a lot of optioins
    "embark-theme/vim"
}

opts = {
}

require("lazy").setup(plugins, opts)

