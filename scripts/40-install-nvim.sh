#!/usr/bin/env bash

source "${DOTFILES:-..}/helpers/log.func"
source "${DOTFILES:-..}/helpers/install.func"
init_log "nvim"

#region functions

is_installed() {
  [[ -d "~/.config/nvim" ]]
}

install() {
  apt-get install -y nvim > $output
  success "nvim installed"

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
  apt-get update > $output
  apt-get upgrade -y nvim > $output
  success "nvim updated"
}

#endregion

ensure_installed
