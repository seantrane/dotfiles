#!/usr/bin/env bash
#
# Install Ember

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "ember" &> /dev/null; then
    ! type "npm" &> /dev/null && source $DOTFILES/node/install.sh
    sh_info "Installing Ember..."
    npm install -g ember-cli
fi

if type "ember" &> /dev/null; then
    sh_success "Ember $(npm info ember version) installed: $(command -v ember)\n"
    npm list -g ember-cli
    echo ""
fi
