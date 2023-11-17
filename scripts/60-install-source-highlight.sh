if [[ -z $(type -P source-highlight) || -n $UPDATE ]]; then
  info "Installing source-highlight"

  debug "updating apt"
  sudo apt update > $output
  debug "installing source-highlight"
  sudo apt install libsource-highlight-common source-highlight -y > $output

  success "source-highlight installed"
else
  success "source-highlight already installed skipping (add the UPDATE env variable if you want to force update)"
fi
