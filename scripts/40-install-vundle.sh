if [[  ( ! -d "$HOME/.vim/bundle/Vundle.vim" ) || -n $UPDATE ]]; then
  info "starting Vundle installation"
  if [ -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    debug "Vundle already cloned. pulling"
    pushd ~/.vim/bundle/Vundle.vim > $output
    git pull > $output
    popd > $output
  else
    debug "cloning Vundle repo from https://github.com/VundleVim/Vundle.vim.git"
    mkdir -p ~/.vim/bundle
    git clone --depth 1 https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim > $output
  fi
  vim +PluginInstall +qall
  success "Vundle installed"
else
  success "Vundle already installed skipping (add the UPDATE env variable if you want to force update)"
fi
