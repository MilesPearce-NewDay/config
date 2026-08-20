# dotfiles (stored in config/, managed with GNU Stow)

This repo contains personal configuration for nvim, tmux, kitty, etc. It is
structured as a set of [GNU Stow](https://www.gnu.org/software/stow/)
packages: each top-level directory (nvim/, tmux/, kitty/) mirrors its final
path relative to `$HOME` (e.g. `nvim/.config/nvim/init.lua` links to
`~/.config/nvim/init.lua`, `tmux/.tmux.conf` links to `~/.tmux.conf`).

Quick start

1. From the repo root run:

   ./scripts/bootstrap.sh

   This installs stow if missing, then for every package folder runs:

   stow --restow --target="$HOME" <package>

   which symlinks:
   - nvim/.config/nvim -> ~/.config/nvim
   - tmux/.tmux.conf -> ~/.tmux.conf
   - kitty/.config/kitty/kitty.conf -> ~/.config/kitty/kitty.conf

   To stow into a different target (e.g. persistent EFS-backed home on
   SageMaker), pass it as an argument: `./scripts/bootstrap.sh /home/sagemaker-user`

2. To manage manually with stow directly (from the repo root):

   stow -t ~ nvim tmux kitty

   Add `-D` instead of nothing to un-stow (remove the symlinks), or
   `-R` to restow (remove then re-add, useful after adding new files).

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
