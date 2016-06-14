#!/usr/bin/env bash
#
# rhino
# JavaScript engine
# https://www.mozilla.org/rhino/

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

install_rhino () {
    if ! type "rhino" &> /dev/null; then
        sh_info "Installing rhino..."
        if type "brew" &> /dev/null; then
            brew install rhino
        elif type "apt-get" &> /dev/null; then
            sudo apt-get -y install rhino
        elif type "yum" &> /dev/null; then
            sudo yum install rhino
        fi
    fi

    if type "rhino" &> /dev/null; then
        sh_success "$(rhino --version) installed: $(which rhino)"
    fi
}
install_rhino
