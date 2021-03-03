info "Installing nvbm/thefuck"

debug "updating apt"
sudo apt update > $output
debug "installing python stuff"
sudo apt install python3-dev python3-pip python3-setuptools -y > $output
debug "pip installing thefuck"
sudo pip3 install thefuck > $output

success "thefuck installed"
