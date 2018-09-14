#!/usr/bin/env bash
#
# Install Laravel.

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

if ! type "laravel" &> /dev/null; then
    ! type "composer" &> /dev/null && source $DOTFILES/composer/install.sh
    sh_info "Installing Laravel..."
    composer global require "laravel/installer=~1.1"
fi

if type "laravel" &> /dev/null; then
    sh_success "$(laravel --version) installed: $(which laravel)"
fi
