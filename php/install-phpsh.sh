#!/usr/bin/env bash
#
# Install phpsh - an interactive shell for PHP
# http://www.phpsh.org

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

if ! type "phpsh" &> /dev/null; then
    sh_info "Installing phpsh - an interactive shell for PHP..."
    if type "brew" &> /dev/null; then
        brew install phpsh
    fi
fi

if type "phpsh" &> /dev/null; then
    sh_success "phpsh $(phpsh --version) installed: $(which phpsh)"
fi
