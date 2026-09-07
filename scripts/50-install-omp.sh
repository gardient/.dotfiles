#!/usr/bin/env bash

source "${DOTFILES:-.}/helpers/log.func"
source "${DOTFILES:-.}/helpers/install.func"
init_log "omp"

is_installed() {
  [[ -n $(which oh-my-posh) ]]
}

install() {
  debug "installing oh-my-posh"
  sudo apt install -y unzip
  curl -s https://ohmyposh.dev/install.sh | bash -s
  success "oh-my-posh installed"
}

update() {
  debug "updating oh-my-posh"
  oh-my-posh upgrade > $output
  success "oh-my-posh updated"
}

ensure_installed
