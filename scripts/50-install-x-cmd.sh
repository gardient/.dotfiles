if [[ ! -f "$HOME/.x-cmd.root/X" || -n $UPDATE ]]; then
  info "starting x-cmd installation"

  debug "getting x-cmd install script"
  eval "$(curl https://get.x-cmd.com)"

  success "x-cmd installed"
else
  success "x-cmd already installed skipping (add the UPDATE env variable if you want to force update)"
fi
