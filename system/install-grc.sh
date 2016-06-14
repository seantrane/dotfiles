#!/usr/bin/env bash
#
# GRC colorizes nifty unix tools all over the place
# (http://www.man-online.org/page/1-grc/)

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

install_grc () {
    if ! type "grc" &> /dev/null; then
        sh_info "Installing grc..."
        if type "brew" &> /dev/null; then
            brew install grc
        elif type "apt-get" &> /dev/null; then
            sudo apt-get -y install grc
        elif type "yum" &> /dev/null; then
            sudo yum install grc
        fi
    fi

    if type "grc" &> /dev/null; then
        sh_success "$(grc --version) installed: $(which grc)"
    fi
}
install_grc
