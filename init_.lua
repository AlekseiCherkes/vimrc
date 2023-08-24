--
-- Neovim specific settings
--

vim.cmd("source ~/.vimrc")

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

-- Remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'machakann/vim-highlightedyank'
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
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }
  use('tpope/vim-fugitive')
  use('wikitopian/hardmode')
  use('neovim/nvim-lspconfig')
  use('lewis6991/gitsigns.nvim')
  use('vim-airline/vim-airline')
  use('vim-airline/vim-airline-themes')
  use('kylechui/nvim-surround')
end)

require("nvim-surround").setup({})

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

require("neo-tree").setup({
  window = {
    filesystem = {
      use_libuv_file_watcher = true
    },
    source_selector = {
      winbar = true
    },
    mappings = {
      ["o"] = 'open',
      ['/'] = 'noop',

      -- remap '?' to g? like in vim-fugitive since I want to use it for navigation
      ['?'] = 'noop',
      ['g?'] = 'show_help' 
    }
  },
  filesystem = {
    window = {
      mappings = {
        -- disable fuzzy finder
        ['I'] = 'toggle_hidden',
        ["/"] = "noop"
      }
    }
  }
})

require('gitsigns').setup {
  -- Undocumented feature that I need
  -- https://github.com/lewis6991/gitsigns.nvim/issues/775
  _signs_staged_enable = true, 

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map('n', '<leader>hs', gs.stage_hunk)
    map('n', '<leader>hr', gs.reset_hunk)
    map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '<leader>hS', gs.stage_buffer)
    map('n', '<leader>hu', gs.undo_stage_hunk)
    map('n', '<leader>hR', gs.reset_buffer)
    map('n', '<leader>hp', gs.preview_hunk)
    map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>hd', gs.diffthis)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}

-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.clangd.setup {}

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)

    -- My ones
    vim.keymap.set("n", "gs", vim.cmd.ClangSwitchSourceHeader)

  end,
})

-- 
-- key mappings
--

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local nt = require('neo-tree.command')
vim.keymap.set("n", "<leader>n", function() nt.execute({action = 'focus', source = 'filesystem', reveal = false}) end)
vim.keymap.set("n", "<leader>r", function() nt.execute({action = 'focus', source = 'filesystem', reveal = true}) end)
vim.keymap.set("n", "<leader>b", function() nt.execute({action = 'focus', source = 'buffers'}) end)
vim.keymap.set("n", "<leader>g", function() nt.execute({action = 'focus', source = 'git_status'}) end)

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- vim.keymap.set("n", "<leader>g", vim.cmd.Git)

--
-- Experimenting
--

vim.api.nvim_create_user_command(
    'MyPaths',
    function ()
        local function printpath(name, desc)
            local value = vim.fn.stdpath(name)
            local str = vim.fn.printf('%s (%s)\n  %s', name, desc, value)
            print(str)
        end

        print('=== stdpath ===')
        printpath('cache', 'Cache directory: arbitrary temporary storage for plugins, etc.')
        printpath('config', 'User configuration directory. |init.vim| is stored here.')
        printpath('config_dirs', 'Other configuration directories.')
        printpath('data', 'User data directory.')
        printpath('data_dirs', 'Other data directories.')
        printpath('log', 'Logs directory (for use by plugins too).')
        printpath('run', 'Run directory: temporary, local storage for sockets, named pipes, etc.')
        printpath('state', 'Session state directory: storage for file drafts, swap, undo, |shada|.')
        print('')

        print('=== runtimepath ===')
        local output = vim.deepcopy(vim.opt.runtimepath:get())
        table.sort(output)
        table.foreach(output, function(k, v) print(v) end)
    end,
    {})

print("OK")

