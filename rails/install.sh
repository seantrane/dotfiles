#!/usr/bin/env bash
#
# Install Ruby On Rails

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "rails" &> /dev/null; then

    # Ensure Ruby/rbenv is installed and gem/rbenv commands are available.
    if ! type "gem" &> /dev/null || ! type "rbenv" &> /dev/null; then
        . "$DOTFILES/ruby/install.sh"
    fi

    # Ensure Node.js is installed.
    ! type "node" &> /dev/null && . "$DOTFILES/node/install.sh"

    if type "gem" &> /dev/null; then
        . "$DOTFILES/ruby/gem-update.sh"
        sh_info "Installing Ruby On Rails..."
        gem install rails -v 4.2.4
    fi

    . "$DOTFILES/ruby/rehash.sh"
fi

if type "rails" &> /dev/null; then
    sh_success "$(rails --version) installed: $(command -v rails)\\n"
    gem which rails
    echo ""
fi
