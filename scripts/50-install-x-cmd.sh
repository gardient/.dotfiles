#!/usr/bin/env bash

source "${DOTFILES:-.}/helpers/log.func"
source "${DOTFILES:-.}/helpers/install.func"
init_log "x-cmd"

is_installed() {
  [[ -f "$HOME/.x-cmd.root/X" ]]
}

install() {
  debug "installing x-cmd"
  eval "$(curl https://get.x-cmd.com)"
  success "x-cmd installed"
}

update() {
  debug "updating x-cmd"
  eval "$(curl https://get.x-cmd.com)"
  success "x-cmd updated"
}

ensure_installed
