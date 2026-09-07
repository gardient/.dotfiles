#!/usr/bin/env bash

source "${DOTFILES:-.}/helpers/log.func"
source "${DOTFILES:-.}/helpers/install.func"
init_log "get-public-keys"

is_installed() {
  [[ -z ${AUTH_GITHUB:-} ]]
}

install() {
  debug "Getting authorized_keys from github"

  if [ -f ~/.ssh/authorized_keys ]; then
    debug "getting diff"
    diff --new-line-format="" --unchanged-line-format="" <(curl -s https://github.com/gardient.keys | sort) <(sort ~/.ssh/authorized_keys) >> ~/.ssh/authorized_keys || echo '' > /dev/null
  else
    debug "Creating authorized keys"
    curl -s https://github.com/gardient.keys > ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys
  fi

  success "Got keys from GitHub"
}

update() {
  install
}

ensure_installed