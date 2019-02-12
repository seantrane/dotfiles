#!/usr/bin/env bash
#
# Install phpsh - an interactive shell for PHP
# http://www.phpsh.org

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "phpsh" &> /dev/null; then
    sh_info "Installing phpsh - an interactive shell for PHP..."
    if type "brew" &> /dev/null; then
        brew install phpsh
    fi
fi

if type "phpsh" &> /dev/null; then
    sh_success "phpsh $(phpsh --version) installed: $(command -v phpsh)"
fi
