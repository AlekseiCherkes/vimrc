--
-- Neovim specific settings for VSCode
--

vim.cmd("source ~/work/vimrc/vs-code-vimrc")

require('packer').startup(function(use)
  use('kylechui/nvim-surround')
end)

require("nvim-surround").setup({})

print("OK")

