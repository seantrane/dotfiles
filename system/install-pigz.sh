#!/usr/bin/env bash
#
# pigz
# Parallel gzip
# http://www.zlib.net/pigz/

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

install_pigz () {
    if ! type "pigz" &> /dev/null; then
        sh_info "Installing pigz..."
        if type "brew" &> /dev/null; then
            brew install pigz
        elif type "apt-get" &> /dev/null; then
            sudo apt-get -y install pigz
        elif type "yum" &> /dev/null; then
            sudo yum install pigz
        fi
    fi

    if type "pigz" &> /dev/null; then
        sh_success "$(pigz --version) installed: $(command -v pigz)"
    fi
}
install_pigz
