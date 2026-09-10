#!/usr/bin/env bash

source "${DOTFILES:-.}/helpers/log.func"
source "${DOTFILES:-.}/helpers/install.func"
init_log "neovim"

is_installed() {
  [[ -f "$(which nvim)" ]]
}

install() {
  sudo apt-get install -y unzip
  curl -fsSL https://raw.githubusercontent.com/MordechaiHadad/bob/master/scripts/install.sh | bash
  ~/.local/bin/bob install stable > $output
  ~/.local/bin/bob use stable > $output
  ln -sf ~/.local/share/bob/nvim-bin/nvim ~/.local/bin/nvim
  success "neovim installed"
}

update() {
  ~/.local/bin/bob install stable > $output
  success "neovim updated"
}

ensure_installed
