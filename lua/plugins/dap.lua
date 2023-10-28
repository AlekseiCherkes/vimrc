return {
    {
        'mfussenegger/nvim-dap',
        lazy = true,
        main = 'dap',
        init = function()
            vim.keymap.set('n', '<F5>', function () require('dap').continue() end, { desc = 'Debug: Start/Continue' })
            vim.keymap.set('n', '<F1>', function () require('dap').step_into() end, { desc = 'Debug: Step Into' })
            vim.keymap.set('n', '<F2>', function () require('dap').step_over() end, { desc = 'Debug: Step Over' })
            vim.keymap.set('n', '<F3>', function () require('dap').step_out() end, { desc = 'Debug: Step Out' })
            vim.keymap.set('n', '<leader>m', function () require('dap').toggle_breakpoint() end, { desc = 'Debug: Toggle Breakpoint' })
            vim.keymap.set('n', '<leader>M', function() require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ') end, { desc = 'Debug: Set Breakpoint' })
        end,
        config = function()
            local dap = require('dap')

            dap.adapters.lldb = {
                type = 'executable',
                command = '/opt/homebrew/opt/llvm/bin/lldb-vscode',
                name = 'lldb'
            }

            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
                args = { "-i", "dap" }
            }

            dap.configurations.cpp = {
                {
                    name = 'Launch',
                    type = 'lldb',
                    request = 'launch',
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                    args = {},

                    -- 💀
                    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
                    --
                    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
                    --
                    -- Otherwise you might get the following error:
                    --
                    --    Error on launch: Failed to attach to the target process
                    --
                    -- But you should be aware of the implications:
                    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
                    -- runInTerminal = false,
                },
            }

            dap.listeners.after.event_initialized['dapui_config'] = function()
                require('dapui').open()
            end

            dap.listeners.before.event_terminated['dapui_config'] = function()
                require('dapui').close()
            end

            dap.listeners.before.event_exited['dapui_config'] = function()
                require('dapui').close()
            end

        end
    },
    {
        'rcarriga/nvim-dap-ui',
        config = true,
        lazy = true,
        init = function()
            vim.keymap.set('n', '<F7>', function() require('dapui').toggle() end, { desc = 'Debug: See last session result.' })
        end
    }
}

