#!/usr/bin/env bash
#
# Install Less.js/lessc

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "lessc" &> /dev/null; then
    ! type "npm" &> /dev/null && source $DOTFILES/node/install.sh
    sh_info "Installing Less.js/lessc..."
    npm install -g less
    # Install Less.js/lessc plugins
    # Clean CSS
    sh_info "Installing Clean CSS plugin for Less.js/lessc..."
    npm install -g less-plugin-clean-css
fi

if type "lessc" &> /dev/null; then
    sh_success "Less.js/lessc $(npm info less version) installed: $(command -v lessc)\n"
    npm list -g less
fi
