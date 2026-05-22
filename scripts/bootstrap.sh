#!/usr/bin/env bash
set -euo pipefail
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
backup(){ if [ -e "$1" ] && [ ! -L "$1" ]; then mv "$1" "$1.bak.$(date +%s)"; fi }

# Ensure ~/.config exists
mkdir -p "$HOME/.config"

# Link nvim
backup "$HOME/.config/nvim"
ln -sfn "$REPO_ROOT/nvim" "$HOME/.config/nvim"

# Link tmux conf to ~/.tmux.conf
backup "$HOME/.tmux.conf"
ln -sfn "$REPO_ROOT/tmux/tmux.conf" "$HOME/.tmux.conf"

# Link kitty
mkdir -p "$HOME/.config/kitty"
backup "$HOME/.config/kitty/kitty.conf"
ln -sfn "$REPO_ROOT/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"

echo "Bootstrap complete. Existing files moved to *.bak.TIMESTAMP when present."
