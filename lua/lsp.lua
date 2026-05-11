-- LSP wiring (replaces nvim-lspconfig).
-- Per-server configs live in `lsp/<name>.lua` at the repo root; Neovim's
-- built-in `vim.lsp.enable` picks them up automatically from runtimepath.

local M = {}

function M.setup()
    -- Pull richer capabilities (snippet support etc.) from cmp-nvim-lsp;
    -- fall back to the protocol defaults if cmp isn't installed.
    local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    local capabilities = ok and cmp_nvim_lsp.default_capabilities()
        or vim.lsp.protocol.make_client_capabilities()

    vim.diagnostic.config({
        severity_sort = true,
        float = {
            border = 'rounded',
            source = true,
        },
    })

    vim.lsp.config('*', { capabilities = capabilities })
    vim.lsp.enable({ 'clangd', 'cmake', 'rust_analyzer', 'lua_ls' })

    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
        callback = function(ev)
            vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

            local function bmap(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
            end

            bmap('n', 'gD',          vim.lsp.buf.declaration,                                                       "LSP declaration")
            bmap('n', 'gd',          vim.lsp.buf.definition,                                                        "LSP definition")
            bmap('n', 'K',           vim.lsp.buf.hover,                                                             "Hover")
            bmap('n', 'gi',          vim.lsp.buf.implementation,                                                    "LSP implementation")
            bmap('n', '<C-k>',       vim.lsp.buf.signature_help,                                                    "Signature help")
            bmap('n', '<space>wa',   vim.lsp.buf.add_workspace_folder,                                              "Add workspace folder")
            bmap('n', '<space>wr',   vim.lsp.buf.remove_workspace_folder,                                           "Remove workspace folder")
            bmap('n', '<space>wl',   function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,       "List workspace folders")
            bmap('n', '<space>D',    vim.lsp.buf.type_definition,                                                   "Type definition")
            bmap('n', '<space>cr',   vim.lsp.buf.rename,                                                            "Rename")
            bmap({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action,                                                "Code action")
            bmap('n', 'gr',          vim.lsp.buf.references,                                                        "References")
            bmap('n', '<space>cf',   function() vim.lsp.buf.format { async = true } end,                           "Format buffer")

            -- Clangd-specific
            vim.keymap.set("n", "gs", function() vim.cmd.ClangdSwitchSourceHeader() end, { desc = "Switch C/C++ header/source" })
        end,
    })
end

return M
