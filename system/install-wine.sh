#!/usr/bin/env bash
#
# Wine Is Not an Emulator
# https://www.winehq.org

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

install_wine () {
    if ! type "wine" &> /dev/null; then
        sh_info "Installing wine..."
        if type "brew" &> /dev/null; then
            brew install wine
            brew install winetricks
        elif type "apt-get" &> /dev/null; then
            sudo apt-get -y install wine
            sudo apt-get -y install winetricks
        elif type "yum" &> /dev/null; then
            sudo yum install wine
            sudo yum install winetricks
        fi
    fi

    if type "wine" &> /dev/null; then
        sh_success "$(wine --version) installed: $(which wine)"
    fi
}
install_wine
