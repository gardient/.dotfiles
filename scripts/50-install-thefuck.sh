if [[ -z $(type -P fuck) || -n $UPDATE ]]; then
  info "Installing nvbn/thefuck"

  debug "updating apt"
  sudo apt update > $output
  debug "installing python stuff"
  sudo apt install python3-dev python3-pip python3-setuptools -y > $output
  debug "pip installing thefuck"
  sudo pip3 install thefuck --user > $output

  success "thefuck installed"
else
  success "nvbn/thefuck already installed skipping (add the UPDATE env variable if you want to force update)"
fi
