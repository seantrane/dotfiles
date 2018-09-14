#!/usr/bin/env bash
#
# Install Memcached

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "memcached" &> /dev/null; then
    sh_info "Installing Memcached..."
    if type "brew" &> /dev/null; then
        brew install memcached
    elif type "apt-get" &> /dev/null; then
        sudo apt-get -y install memcached
    elif type "yum" &> /dev/null; then
        sudo yum install memcached
    fi
fi

if type "memcached" &> /dev/null; then
    sh_success "$(memcached --version) installed: $(which memcached)"
fi
