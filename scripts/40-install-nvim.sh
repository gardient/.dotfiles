#!/usr/bin/env bash

source "${DOTFILES:-.}/helpers/log.func"
source "${DOTFILES:-.}/helpers/install.func"
init_log "neovim"

#region functions

is_installed() {
  [[ -d "~/.config/nvim" ]]
}

install() {
  sudo apt-get install -y neovim > $output
  success "neovim installed"

  # install lazyvim
  debug "installing lazyvim"
  # required
  mv ~/.config/nvim{,.bak} > $output

  # optional but recommended
  mv ~/.local/share/nvim{,.bak} > $output
  mv ~/.local/state/nvim{,.bak} > $output
  mv ~/.cache/nvim{,.bak} > $output

  git clone https://github.com/LazyVim/starter ~/.config/nvim > $output

  rm -rf ~/.config/nvim/.git
  success "lazyvim installed"
}

update() {
  sudo apt-get update > $output
  sudo apt-get upgrade -y neovim > $output
  success "neovim updated"
}

#endregion

ensure_installed
