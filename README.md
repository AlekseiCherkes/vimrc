# vimrc

Personal configuration files for `Vim`/`Neovim`/`IdeaVim`

## Help

- [NERDTree](https://github.com/JetBrains/ideavim/wiki/NERDTree-support#supported-commands)

## Install (fresh macOS)

Assumes [Homebrew](https://brew.sh) is already installed.

1. Install the editors and runtime tools the config depends on:

   ```
   brew install neovim        # 0.12+ required by nvim-treesitter's main branch
   brew install vim           # newer than macOS-bundled vim, used via ~/.vimrc
   brew install git
   brew install tree-sitter   # parser compiler invoked by :TSUpdate; needs >= 0.26.1
   brew install ripgrep       # telescope live_grep
   brew install fd            # telescope find_files (optional, faster than the default walker)
   ```

2. Install a Nerd Font so the icons in `lualine`, `neo-tree`, and `oil` render — otherwise you'll see boxes:

   ```
   brew install --cask font-jetbrains-mono-nerd-font
   ```

   Point your terminal (iTerm2 / Ghostty / Terminal.app) at the installed font.

3. Install the LSP servers — see [LSP servers](#lsp-servers) below.

4. Clone and symlink the config. The install script uses SSH to clone, so a working GitHub SSH key is required (or edit the script to use HTTPS):

   ```
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/AlekseiCherkes/vimrc/main/scripts/install.sh)"
   ```

5. Launch `nvim`. `lazy.nvim` bootstraps itself and installs every plugin; the `:TSUpdate` build step then compiles the tree-sitter parsers listed in `lua/plugins/treesitter.lua`. Wait for the install messages to finish, then restart Neovim once so the freshly built parsers are picked up.

6. Sanity-check:

   ```
   :checkhealth            # general environment
   :checkhealth lsp        # confirm the LSP servers actually attached
   :Lazy                   # every plugin should show as installed
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

