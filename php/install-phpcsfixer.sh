#!/usr/bin/env bash
#
# Install PHP-CS-Fixer
# http://cs.sensiolabs.org

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "php-cs-fixer" &> /dev/null; then
    sh_info "Installing PHP-CS-Fixer..."
    if type "brew" &> /dev/null; then
        brew install php-cs-fixer
    fi
fi

if type "php-cs-fixer" &> /dev/null; then
    sh_success "PHP-CS-Fixer $(php-cs-fixer --version) installed: $(which php-cs-fixer)"
fi
