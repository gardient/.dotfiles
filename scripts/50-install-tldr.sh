if [[ -z $(type -P tldr) || -n $UPDATE ]]; then
  info "Installing tldr-pages/tldr"

  debug "updating apt"
  sudo apt update > $output
  debug "installing python stuff"
  sudo apt install python3-dev python3-pip python3-setuptools -y > $output
  debug "pip installing tldr"
  pip3 install tldr --user > $output

  success "tldr-pages/tldr installed"
else
  success "tldr-pages/tldr already installed skipping (add the UPDATE env variable if you want to force update)"
fi
