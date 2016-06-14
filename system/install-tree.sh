#!/usr/bin/env bash
#
# tree
# Display directories as trees (with optional color/HTML output)
# http://mama.indstate.edu/users/ice/tree/

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

install_tree () {
    if ! type "tree" &> /dev/null; then
        sh_info "Installing tree..."
        if type "brew" &> /dev/null; then
            brew install tree
        elif type "apt-get" &> /dev/null; then
            sudo apt-get -y install tree
        elif type "yum" &> /dev/null; then
            sudo yum install tree
        fi
    fi

    if type "tree" &> /dev/null; then
        sh_success "$(tree --version) installed: $(which tree)"
    fi
}
install_tree
