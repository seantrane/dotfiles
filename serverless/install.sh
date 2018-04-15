#!/usr/bin/env bash
#
# Install Serverless Framework
# 
# Serverless Framework is your single toolkit for
# deploying serverless architectures to any provider.
# https://serverless.com/framework/

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

if ! type "serverless" &> /dev/null; then
    ! type "npm" &> /dev/null && source $DOTFILES/node/install.sh
    sh_info "Installing Serverless Framework..."
    npm install -g serverless
fi

if type "serverless" &> /dev/null; then
    sh_success "Serverless Framework $(npm info serverless version) installed: $(which serverless)\n"
    npm list -g serverless
fi
