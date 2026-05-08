# vimrc

Personal configuration files for `Vim`/`Neovim`/`IdeaVim`

## Help

- [NERDTree](https://github.com/JetBrains/ideavim/wiki/NERDTree-support#supported-commands)

## Install

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/AlekseiCherkes/vimrc/main/scripts/install.sh)"
```

## LSP servers

Mason was intentionally dropped — keeping LSP binaries in sync with system tooling via Homebrew is one fewer moving part than maintaining a parallel installation under `~/.local/share/nvim/mason/`. The servers used by `lua/plugins/lsp.lua` should be installed once:

```
brew install llvm                  # provides clangd; PATH may need /opt/homebrew/opt/llvm/bin
brew install rust-analyzer
brew install lua-language-server   # lua_ls
pipx install cmake-language-server # or `pip install --user cmake-language-server`
```

If a server binary isn't on `$PATH`, `vim.lsp.enable(...)` silently does nothing for that filetype — no error, just no completions/diagnostics. Run `:checkhealth lsp` inside Neovim to see which servers actually attached.

