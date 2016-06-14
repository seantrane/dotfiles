#!/usr/bin/env bash
#
# Install MySQL.

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

if ! type "mysql" &> /dev/null || [[ "$OSTYPE" == "darwin"* ]]; then
    sh_info "Installing MySQL..."
    if type "brew" &> /dev/null; then
        brew install mysql
    elif type "apt-get" &> /dev/null; then
        sudo apt-get -y install mysql
    elif type "yum" &> /dev/null; then
        sudo yum install mysql
    fi
fi

if type "mysql" &> /dev/null; then
    sh_success "$(mysql --version) installed: $(which mysql)"
fi
