info "starting starship installation"

install_temp=`mktemp`
debug "\$install_temp: $install_temp"

debug "getting starship install script"
wget -q https://starship.rs/install.sh -O "$install_temp"
chmod u+x "$install_temp"

debug "installing starship"
$install_temp -y -b ~/bin > $output

debug "removing temp file"
rm "$install_temp"

success "starship installed"
