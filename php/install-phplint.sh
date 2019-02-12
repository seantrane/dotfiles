#!/usr/bin/env bash
#
# Install PHPLint
# http://www.icosaedro.it/phplint/

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "phplint" &> /dev/null; then
    sh_info "Installing PHPLint..."
    if type "brew" &> /dev/null; then
        brew install gcc
        brew install phplint
    fi
fi

if type "phplint" &> /dev/null; then
    sh_success "PHPLint $(phplint --version) installed: $(command -v phplint)"
fi
