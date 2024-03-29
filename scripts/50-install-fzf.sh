if [[ -z $(which fzf) || -n $UPDATE ]]; then
  info "starting fzf installation"
  if [ -d ~/.fzf ]; then
    debug "fzf already cloned. pulling"
    pushd ~/.fzf > $output
    git pull > $output
    popd > $output
  else
    debug "cloning fzf repo from https://github.com/junegunn/fzf.git"
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf > $output
  fi

  debug "installing fzf"
  ~/.fzf/install --all > $output

  success "fzf installed"
else
  success "fzf already installed skipping (add the UPDATE env variable if you want to force update)"
fi
