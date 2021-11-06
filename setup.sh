#!/usr/bin/env bash 

set -eu

install_package() {
  sudo apt-get install -y "$1"
}

setup_nvim() {
  mkdir -p "$HOME/.config/nvim"
}

if [ $SPIN ]; then
  link_source="$HOME/dotfiles"
  git config --global --unset-all credential.helper
fi
