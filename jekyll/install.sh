#!/usr/bin/env bash
#
# Install Jekyll

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "jekyll" &> /dev/null; then

    # Ensure Ruby is installed and `gem` command is available.
    ! type "gem" &> /dev/null && source $DOTFILES/ruby/install.sh

    if type "gem" &> /dev/null; then
        source $DOTFILES/ruby/gem-update.sh
        sh_info "Installing Jekyll..."
        gem install jekyll
    fi

    source $DOTFILES/ruby/rehash.sh
fi

if type "jekyll" &> /dev/null; then
    sh_success "$(jekyll --version) installed: $(command -v jekyll)\n"
    gem which jekyll
    echo ""
fi
