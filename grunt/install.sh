#!/usr/bin/env bash
#
# Install Grunt

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "grunt" &> /dev/null; then
    ! type "npm" &> /dev/null && source $DOTFILES/node/install.sh
    sh_info "Installing Grunt..."
    npm install -g grunt-cli
fi

if type "grunt" &> /dev/null; then
    sh_success "Grunt $(npm info grunt version) installed: $(which grunt)\n"
    npm list -g grunt-cli
    echo ""
fi
