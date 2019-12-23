#!/usr/bin/env bash
#
# Install Boom
#
# boom manages your text snippets on your command line.
# You can stash away text like URLs, canned responses, and
# important notes and then quickly copy them onto your clipboard, ready for pasting.
# http://zachholman.com/boom
# https://github.com/holman/boom

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "boom" &> /dev/null; then

    # Ensure Ruby is installed and `gem` command is available.
    ! type "gem" &> /dev/null && . "$DOTFILES/ruby/install.sh"

    if type "gem" &> /dev/null; then
        . "$DOTFILES/ruby/gem-update.sh"
        sh_info "Installing Boom..."
        gem install boom
    fi

    . "$DOTFILES/ruby/rehash.sh"
fi

if type "boom" &> /dev/null; then
    sh_success "$(boom --version) installed: $(command -v boom)\n"
    gem which boom
    echo
fi
