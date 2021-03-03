debug "\$AUTH_GITHUB: $AUTH_GITHUB"
if [ ! -z $AUTH_GITHUB ]; then
  info "Getting authorized_keys from github"

  if [ -f ~/.ssh/authorized_keys ]; then
    debug "getting diff"
    diff --new-line-format="" --unchanged-line-format="" <(curl -s https://github.com/gardient.keys | sort) <(sort ~/.ssh/authorized_keys) >> ~/.ssh/authorized_keys
  else
    debug "Creating authorized keys"
    curl -s https://github.com/gardient.keys > ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys
  fi
  
  success "Got keys from GitHub"
else
  success "skipping get keys from GitHub"
fi