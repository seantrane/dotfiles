#!/usr/bin/env bash
#
# Install Yeoman
# Yeoman helps you to kickstart new projects, prescribing best practices and tools to help you stay productive.
# https://github.com/yeoman/yo

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

if ! type "yo" &> /dev/null; then
    ! type "npm" &> /dev/null && source $DOTFILES/node/install.sh
    sh_info "Installing Yeoman..."
    npm install -g yo@latest
fi

if type "yo" &> /dev/null; then
    sh_success "Yeoman $(npm info yo version) installed: $(which yo)\n"
    npm list -g yo
    echo ""

    #
    # Install Yeoman generators
    # 

    # Jekyllized
    # https://github.com/sondr3/generator-jekyllized
    # if ! type "gulp" &> /dev/null; then
    #     source $DOTFILES/gulp/install.sh
    # fi
    # sh_info "Installing Jekyllized..."
    # npm install -g generator-jekyllized

fi
