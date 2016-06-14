#!/usr/bin/env bash
#
# Install PHPLint
# http://www.icosaedro.it/phplint/

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

if ! type "phplint" &> /dev/null; then
    sh_info "Installing PHPLint..."
    if type "brew" &> /dev/null; then
        brew install gcc
        brew install phplint
    fi
fi

if type "phplint" &> /dev/null; then
    sh_success "PHPLint $(phplint --version) installed: $(which phplint)"
fi
