#!/usr/bin/env bash
#
# Install PHP CodeSniffer
# https://github.com/squizlabs/PHP_CodeSniffer

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "phpcs" &> /dev/null; then
    sh_info "Installing PHP CodeSniffer..."
    if type "brew" &> /dev/null; then
        brew install php-code-sniffer
    fi
fi

if type "phpcs" &> /dev/null; then
    sh_success "PHP CodeSniffer $(phpcs --version) installed: $(command -v phpcs)"
fi
