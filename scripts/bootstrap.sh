#!/usr/bin/env bash
set -euo pipefail
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="${1:-$HOME}"

# Ensure stow is installed
if ! command -v stow >/dev/null 2>&1; then
  echo "GNU Stow not found, attempting install..."
  if command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update -y && sudo apt-get install -y stow
  elif command -v brew >/dev/null 2>&1; then
    brew install stow
  elif command -v conda >/dev/null 2>&1; then
    conda install -y -c conda-forge stow
  else
    echo "Could not find a package manager to install stow. Install it manually." >&2
    exit 1
  fi
fi

cd "$REPO_ROOT"

# Each top-level directory here is a stow "package" whose internal layout
# mirrors its final path relative to $TARGET (e.g. nvim/.config/nvim/...).
for pkg in */; do
  pkg="${pkg%/}"
  [ "$pkg" = "scripts" ] && continue
  echo "Stowing $pkg -> $TARGET"
  stow --restow --target="$TARGET" "$pkg"
done

echo "Bootstrap complete."
