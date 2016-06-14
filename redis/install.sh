#!/usr/bin/env bash
#
# Install Redis

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

if ! type "redis-cli" &> /dev/null; then
    sh_info "Installing Redis..."
    if type "brew" &> /dev/null; then
        brew install redis
    elif type "apt-get" &> /dev/null; then
        sudo apt-get -y install redis
    elif type "yum" &> /dev/null; then
        sudo yum install redis
    fi
fi

if type "redis-cli" &> /dev/null; then
    sh_success "$(redis-cli --version) installed: $(which redis-cli)"
fi
