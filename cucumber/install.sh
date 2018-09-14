#!/usr/bin/env bash
#
# Install Cucumber
# https://cucumber.io/

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "cucumber" &> /dev/null; then
    ! type "npm" &> /dev/null && source $DOTFILES/node/install.sh
    sh_info "Installing Cucumber..."
    npm install -g cucumber
fi

if type "cucumber" &> /dev/null; then
    sh_success "Cucumber $(npm info cucumber version) installed: $(which cucumber)\n"
    npm list -g cucumber
    echo ""
fi
