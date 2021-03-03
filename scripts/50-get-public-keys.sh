if [ ! -z $AUTH_GITHUB ]; then
  info "Getting authorized_keys from github"
  if [ -f ~/.ssh/authorized_keys ]; then
    diff <(curl -s https://github.com/gardient.keys | sort) <(sort ~/.ssh/authorized_keys) >> ~/.ssh/authorized_keys
  else
    curl -s https://github.com/gardient.keys > ~/.ssh/authorized_keys; chmod 600 ~/.ssh/authorized_keys
  fi
  success "Got keys from GitHub"
else
  success "skipping get keys from GitHub"
fi