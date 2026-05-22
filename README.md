# dotfiles (stored in config/)

This repo contains personal configuration for nvim, tmux, kitty, etc. Files are kept in this repo root under app-named directories (nvim/, tmux/, kitty/).

Why not ".config"? Using a plain `config/` folder in the repo is fine — it avoids hidden files in the repo root and is easy to sync. On each host the contents should be symlinked into the XDG locations (e.g. ~/.config/nvim). Use the provided installer to create those symlinks.

Quick start

1. From the repo root run:

   ./scripts/bootstrap.sh

   This will symlink:
   - nvim -> ~/.config/nvim
   - tmux/tmux.conf -> ~/.tmux.conf
   - kitty/kitty.conf -> ~/.config/kitty/kitty.conf

2. Install neovim dependencies (example for Arch):
   - neovim, python-pynvim

3. Open nvim and let the plugin manager install plugins (lazy.nvim).

Neovim: Copilot & LSP

- This config uses mason + nvim-lspconfig (see nvim/lua/plugins/lsp.lua).
- Copilot integration added via `zbirenbaum/copilot.lua`. Accept suggestions with Ctrl-Y (<C-y>).
- If you prefer deeper completion integration consider switching to `nvim-cmp` + `copilot-cmp`.

Tmux

- Prefix is Ctrl-A. Use prefix + v for vertical split, prefix + h for horizontal split.
- Minimal look (status disabled) and mouse support enabled.

If anything should be kept or excluded when bootstrapping on a new machine, open an issue or edit scripts/bootstrap.sh.
