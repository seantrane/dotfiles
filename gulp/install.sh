#!/usr/bin/env bash
#
# Install Gulp

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

if ! type "gulp" &> /dev/null; then
    ! type "npm" &> /dev/null && source $DOTFILES/node/install.sh
    sh_info "Installing Gulp..."
    npm install -g gulp
fi

if type "gulp" &> /dev/null; then
    sh_success "Gulp $(npm info gulp version) installed: $(which gulp)\n"
    npm list -g gulp
    echo ""
fi
