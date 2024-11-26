if [[ -z $(which oh-my-posh) || -n $UPDATE ]]; then
  info "starting posh installation"

  debug installing deps
  sudo apt install -y unzip
  debug "getting posh install script"
  curl -s https://ohmyposh.dev/install.sh | bash -s

  success "posh installed"
else
  success "posh already installed skipping (add the UPDATE env variable if you want to force update)"
fi