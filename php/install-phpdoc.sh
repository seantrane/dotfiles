#!/usr/bin/env bash
#
# Install phpDocumentor
# http://www.phpdoc.org

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "phpdoc" &> /dev/null; then
    sh_info "Installing phpDocumentor..."
    if type "brew" &> /dev/null; then
        brew install phpdocumentor
    fi
fi

if type "phpdoc" &> /dev/null; then
    sh_success "phpDocumentor $(phpdoc --version) installed: $(command -v phpdoc)"
fi
