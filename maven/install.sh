#!/usr/bin/env bash
#
# Install Maven

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

if ! type "maven" &> /dev/null; then
    sh_info "Installing Maven..."
    if type "brew" &> /dev/null; then
        brew install maven
    elif type "apt-get" &> /dev/null; then
        sudo apt-get -y install maven
    elif type "yum" &> /dev/null; then
        sudo yum install maven
    fi
fi

if type "maven" &> /dev/null; then
    sh_success "$(maven --version) installed: $(which maven)"
fi
