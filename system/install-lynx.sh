#!/usr/bin/env bash
#
# lynx
# Text-based web browser
# http://lynx.isc.org

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

install_lynx () {
    if ! type "lynx" &> /dev/null; then
        sh_info "Installing lynx..."
        if type "brew" &> /dev/null; then
            brew install lynx
        elif type "apt-get" &> /dev/null; then
            sudo apt-get -y install lynx
        elif type "yum" &> /dev/null; then
            sudo yum install lynx
        fi
    fi

    if type "lynx" &> /dev/null; then
        sh_success "$(lynx --version) installed: $(which lynx)"
    fi
}
install_lynx
