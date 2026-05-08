return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "folke/neodev.nvim",
        },
        config = function()
            -- Add additional capabilities supported by nvim-cmp
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
            require("neodev").setup({})

            -- Diagnostic display tuning
            vim.diagnostic.config({
                severity_sort = true,
                float = {
                    border = 'rounded',
                    source = true,
                },
            })

            -- Setup language servers.
            vim.lsp.config('*', { capabilities = capabilities })
            vim.lsp.enable({ 'clangd', 'cmake', 'rust_analyzer', 'lua_ls' })

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local function bmap(mode, lhs, rhs, desc)
                        vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
                    end
                    bmap('n', 'gD',         vim.lsp.buf.declaration,                                         "LSP declaration")
                    bmap('n', 'gd',         vim.lsp.buf.definition,                                          "LSP definition")
                    bmap('n', 'K',          vim.lsp.buf.hover,                                               "Hover")
                    bmap('n', 'gi',         vim.lsp.buf.implementation,                                      "LSP implementation")
                    bmap('n', '<C-k>',      vim.lsp.buf.signature_help,                                      "Signature help")
                    bmap('n', '<space>wa',  vim.lsp.buf.add_workspace_folder,                                "Add workspace folder")
                    bmap('n', '<space>wr',  vim.lsp.buf.remove_workspace_folder,                             "Remove workspace folder")
                    bmap('n', '<space>wl',  function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "List workspace folders")
                    bmap('n', '<space>D',   vim.lsp.buf.type_definition,                                     "Type definition")
                    bmap('n', '<space>rn',  vim.lsp.buf.rename,                                              "Rename")
                    bmap({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action,                                 "Code action")
                    bmap('n', 'gr',         vim.lsp.buf.references,                                          "References")
                    bmap('n', '<space>f',   function() vim.lsp.buf.format { async = true } end,             "Format buffer")

                    -- My ones
                    vim.keymap.set("n", "gs", function() vim.cmd.ClangdSwitchSourceHeader() end, { desc = "Switch C/C++ header/source" })
                end,
            })
        end,
    },
}
