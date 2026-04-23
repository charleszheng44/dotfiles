#!/usr/bin/env bash

set -e

CONFIG_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_DIR="$( cd "$CONFIG_DIR/.." && pwd )"

link() {
    local src="$1" dst="$2"
    if [ -e "$dst" ] || [ -L "$dst" ]; then
        rm -rf "$dst"
    fi
    ln -s "$src" "$dst"
}

mkdir -p ~/.config

link "$CONFIG_DIR/zshrc"         ~/.zshrc
link "$CONFIG_DIR/zsh"           ~/.zsh
link "$CONFIG_DIR/tmux.conf"     ~/.tmux.conf
link "$CONFIG_DIR/tmux"          ~/.tmux
link "$CONFIG_DIR/ideavimrc"     ~/.ideavimrc
link "$CONFIG_DIR/starship.toml" ~/.config/starship.toml
link "$CONFIG_DIR/nvim"          ~/.config/nvim
link "$CONFIG_DIR/ghostty"       ~/.config/ghostty
link "$REPO_DIR/fzf-git.sh"      ~/.config/fzf-git.sh
