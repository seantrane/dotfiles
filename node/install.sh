#!/usr/bin/env bash
#
# Install Node.js

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "node" &> /dev/null; then
    sh_info "Installing Node.js..."
    if type "brew" &> /dev/null; then
        brew install node
    elif type "apt-get" &> /dev/null; then
        curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
        sudo apt-get -y install nodejs
        sudo apt-get -y install build-essential
    elif type "yum" &> /dev/null; then
        curl --silent --location https://rpm.nodesource.com/setup | bash -
        sudo yum install nodejs npm
        sudo yum install gcc-c++ make
    fi
    sh_info "Adding ~/.node/bin to PATH..."
    source $( cd "${BASH_SOURCE%/*}" && pwd )/path.zsh
fi

if type "node" &> /dev/null; then
    sh_success "Node.js $(node --version) installed: $(command -v node)"
fi

if type "npm" &> /dev/null; then
    npm install npm --global
    sh_success "npm $(npm --version) installed: $(command -v npm)"
fi
