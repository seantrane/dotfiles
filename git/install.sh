#!/usr/bin/env bash
#
# Install Git

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

if ! type "git" &> /dev/null; then
    sh_info "Installing Git..."
    if type "brew" &> /dev/null; then
        brew install git
        brew install git-lfs
    elif type "apt-get" &> /dev/null; then
        sudo apt-get -y install git
    elif type "yum" &> /dev/null; then
        sudo yum install git
    fi
fi

if type "git" &> /dev/null; then
    sh_success "$(git --version) installed: $(which git)"
fi
