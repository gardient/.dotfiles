#!/usr/bin/env bash

source "${DOTFILES:-.}/helpers/log.func"
source "${DOTFILES:-.}/helpers/install.func"
init_log "lazyvim"

is_installed() {
  [[ -f "~/.config/nvim/lua/config/lazy.lua" ]]
}

install() {
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
  warn "lazyvim cannot be updated automatically, please update manually"
}

ensure_installed