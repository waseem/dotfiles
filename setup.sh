#!/usr/bin/env bash 

set -eu

link_source="$HOME/dotfiles"
xdg_config="$HOME/.config"

declare -a packages=(
  "ack"
  "ripgrep"
  "tig"
)

declare -a dotfiles=(
  "gemrc"
  "ackrc"
  "gitignore"
  "rspec"
)

install_package() {
  sudo apt-get install -y "$1"
}

link_file() {
  if [ "$1" == "setup.sh" ] || [ "$1" == "." ] || [ "$1" == ".." ]; then
    return
  fi

  source=$link_source/$1

  ln -sf "$source" "$2"
}

setup_nvim() {
  # link init.vim
  nvim_config_dir="$xdg_config/nvim"
  mkdir -p "$nvim_config_dir"
  link_file "nvim-init" "$nvim_config_dir/init.vim"

  # install vim-plug
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

setup_ohmyzsh() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  mv "$HOME/.zshrc" "$HOME/.zshrc-ohmyzsh"
  link_file "zshrc-linux" "$HOME/.zshrc"
}

if [ $SPIN ]; then
  for dotfile in "${dotfiles[@]}"; do
    link_file "$dotfile" "$HOME/.$dotfile"
  done
  link_file "vimrc-minimal" "$HOME/.vimrc"

  # Copying gitconfig because commands below will modify ~/dotfiles/gitconfig
  cp "$link_source/gitconfig" "$HOME/.gitconfig"

  git config --global --unset-all credential.helper
  git config --global --unset-all gpg.program
  git config --global --unset-all commit.gpgSign
  setup_nvim
  setup_ohmyzsh

  for package in "${packages[@]}"; do
    install_package "$package"
  done

  # For Coc-solargraph
  gem install solargraph
fi
