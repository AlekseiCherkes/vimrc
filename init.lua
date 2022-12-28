--
-- Neovim specific settings
--

vim.cmd("source ~/.vimrc")

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.x',
    requires = {{'nvim-lua/plenary.nvim'}}
  }
  use {
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  }
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
  use('preservim/nerdtree')
  use('tpope/vim-fugitive')
end)

require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all"
  ensure_installed = { 
	  "help",
	  "bash",
	  "cmake", 
	  "comment", 
	  "diff", 
	  "c", 
	  "cpp", 
	  "lua",
	  "vim",
	  "markdown",
	  "python",
	  "rust" 
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  highlight = {
    enable = true, -- `false` will disable the whole extension

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  }
}
}

-- 
-- key mappings
--

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>n", vim.cmd.NERDTreeFocus)
vim.keymap.set("n", "<leader>g", vim.cmd.Git)

print("OK")

