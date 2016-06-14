#!/usr/bin/env bash
#
# lua
# Powerful, lightweight programming language
# http://www.lua.org

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

install_lua () {
    if ! type "lua" &> /dev/null; then
        sh_info "Installing lua..."
        if type "brew" &> /dev/null; then
            brew install lua
        elif type "apt-get" &> /dev/null; then
            sudo apt-get -y install lua
        elif type "yum" &> /dev/null; then
            sudo yum install lua
        fi
    fi

    if type "lua" &> /dev/null; then
        sh_success "$(lua --version) installed: $(which lua)"
    fi
}
install_lua
