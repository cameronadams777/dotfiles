#!/usr/bin/env bash
# Symlink dotfiles into place. Safe to re-run: existing links are refreshed,
# and any real file/directory in the way is moved to <path>.bak.<timestamp>.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}"
STAMP="$(date +%Y%m%d%H%M%S)"

link() {
  local src="$DOTFILES/$1" dest="$2"

  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "ok      $dest"
    return
  fi

  mkdir -p "$(dirname "$dest")"

  if [ -L "$dest" ]; then
    rm "$dest"
  elif [ -e "$dest" ]; then
    mv "$dest" "$dest.bak.$STAMP"
    echo "backup  $dest -> $dest.bak.$STAMP"
  fi

  ln -s "$src" "$dest"
  echo "link    $dest -> $src"
}

link .zshrc   "$HOME/.zshrc"
link nvim     "$CONFIG/nvim"
link ghostty  "$CONFIG/ghostty"

if [ "$(uname -s)" = "Darwin" ]; then
  link aerospace  "$CONFIG/aerospace"
  link sketchybar "$CONFIG/sketchybar"
fi
