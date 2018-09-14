#!/usr/bin/env bash
#
# zopfli
# New zlib (gzip, deflate) compatible compressor
# https://code.google.com/p/zopfli/

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

install_zopfli () {
    if ! type "zopfli" &> /dev/null; then
        sh_info "Installing zopfli..."
        if type "brew" &> /dev/null; then
            brew install zopfli
        elif type "apt-get" &> /dev/null; then
            sudo apt-get -y install zopfli
        elif type "yum" &> /dev/null; then
            sudo yum install zopfli
        fi
    fi

    if type "zopfli" &> /dev/null; then
        sh_success "$(zopfli --version) installed: $(which zopfli)"
    fi
}
install_zopfli
