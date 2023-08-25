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

vim.g.neo_tree_remove_legacy_commands = 1

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

require("lazy").setup("plugins")

--
-- From old configuration with Packer
-- TODO: refactor
--

require("config")

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

