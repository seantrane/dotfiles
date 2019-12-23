#!/usr/bin/env bash
#
# Install Serverless Framework
#
# Serverless Framework is your single toolkit for
# deploying serverless architectures to any provider.
# https://serverless.com/framework/

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "serverless" &> /dev/null; then
    ! type "npm" &> /dev/null && . "$DOTFILES/node/install.sh"
    sh_info "Installing Serverless Framework..."
    npm install -g serverless
fi

if type "serverless" &> /dev/null; then
    sh_success "Serverless Framework $(npm info serverless version) installed: $(command -v serverless)\n"
    npm list -g serverless
fi
