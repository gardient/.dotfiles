#!/usr/bin/env bash

source "${DOTFILES:-.}/helpers/log.func"
source "${DOTFILES:-.}/helpers/install.func"
init_log "source-highlight"

is_installed() {
  [[ -n $(type -P source-highlight) ]]
}

install() {
  debug "installing source-highlight"
  sudo apt update > $output
  sudo apt install libsource-highlight-common source-highlight -y > $output
  success "source-highlight installed"
}

update() {
  debug "updating source-highlight"
  sudo apt update > $output
  sudo apt install libsource-highlight-common source-highlight -y > $output
  success "source-highlight updated"
}

ensure_installed
