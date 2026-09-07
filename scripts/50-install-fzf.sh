#!/usr/bin/env bash

source "${DOTFILES:-..}/helpers/log.func"
source "${DOTFILES:-..}/helpers/install.func"
init_log "fzf"

is_installed() {
  [[ -n $(which fzf) ]]
}

install() {
  debug "cloning fzf repo from https://github.com/junegunn/fzf.git"
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf > $output

  debug "installing fzf"
  ~/.fzf/install --all > $output

  success "fzf installed"
}

update() {
  debug "updating fzf"
  ~/.fzf/bin/fzf --update > $output
  success "fzf updated"
}

ensure_installed
