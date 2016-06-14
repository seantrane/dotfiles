#!/usr/bin/env bash
#
# Install Bower

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

if ! type "bower" &> /dev/null; then
    ! type "npm" &> /dev/null && source $DOTFILES/node/install.sh
    sh_info "Installing Bower..."
    npm install -g bower
fi

if type "bower" &> /dev/null; then
    sh_success "Bower $(npm info bower version) installed: $(which bower)\n"
    npm list -g bower
    echo ""
fi
