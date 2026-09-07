#!/usr/bin/env bash

source "${DOTFILES:-.}/helpers/log.func"
source "${DOTFILES:-.}/helpers/install.func"
init_log "tldr"

is_installed() {
  [[ -n $(type -P tldr) ]]
}

install() {
  debug "Installing tldr-pages/tldr"

  debug "updating apt"
  sudo apt update > $output
  debug "installing python stuff"
  sudo apt install python3-dev python3-pip python3-setuptools -y > $output
  debug "pip installing tldr"
  pip3 install tldr --user > $output

  success "tldr-pages/tldr installed"
}

update() {
  debug "updating tldr-pages/tldr"
  pip3 install --upgrade tldr --user > $output
  success "tldr-pages/tldr updated"
}

ensure_installed
