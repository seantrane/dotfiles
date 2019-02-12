#!/usr/bin/env bash
#
# Install Sass

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "sass" &> /dev/null; then

    # Ensure Ruby is installed and `gem` command is available.
    ! type "gem" &> /dev/null && source $DOTFILES/ruby/install.sh

    if type "gem" &> /dev/null; then
        source $DOTFILES/ruby/gem-update.sh
        sh_info "Installing Sass..."
        gem install sass
    fi

    source $DOTFILES/ruby/rehash.sh
fi

if type "sass" &> /dev/null; then
    sh_success "$(sass --version) installed: $(command -v sass)\n"
    gem which sass
    echo ""
fi
