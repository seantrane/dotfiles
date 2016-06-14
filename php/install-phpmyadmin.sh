#!/usr/bin/env bash
#
# Install phpMyAdmin
# http://www.phpmyadmin.net

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

if ! type "phpmyadmin" &> /dev/null; then
    sh_info "Installing phpMyAdmin..."
    if type "brew" &> /dev/null; then
        brew install phpmyadmin
    fi
fi

if type "phpmyadmin" &> /dev/null; then
    sh_success "phpMyAdmin $(phpmyadmin --version) installed: $(which phpmyadmin)"
fi
