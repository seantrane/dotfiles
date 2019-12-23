#!/usr/bin/env bash
#
# Install Packer

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "packer" &> /dev/null; then
    sh_info "Installing Packer..."
    if type "brew" &> /dev/null; then
        brew install packer
    elif type "apt-get" &> /dev/null; then
        # sudo apt-get update
        sudo apt-get -y install packer
    elif type "yum" &> /dev/null; then
        sudo yum install packer
    fi
fi

if type "packer" &> /dev/null; then
    sh_success "$(packer --version) installed: $(command -v packer)"
fi
