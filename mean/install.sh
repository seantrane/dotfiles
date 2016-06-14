#!/usr/bin/env bash
#
# Install MEAN
# 
# MEAN is an opinionated fullstack javascript framework - 
# which simplifies and accelerates web application development.
# http://mean.io

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

if ! type "mean" &> /dev/null; then
    # MEAN requires; Node, Gulp and Bower
    ! type "npm" &> /dev/null && source $DOTFILES/node/install.sh
    ! type "gulp" &> /dev/null && source $DOTFILES/gulp/install.sh
    ! type "bower" &> /dev/null && source $DOTFILES/bower/install.sh
    sh_info "Installing MEAN..."
    npm install -g mean-cli
fi

if type "mean" &> /dev/null; then
    sh_success "MEAN $(npm info mean-cli version) installed: $(which mean)\n"
    npm list -g mean-cli
fi
