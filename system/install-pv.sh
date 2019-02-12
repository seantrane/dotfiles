#!/usr/bin/env bash
#
# pv
# Monitor data's progress through a pipe
# https://www.ivarch.com/programs/pv.shtml

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

install_pv () {
    if ! type "pv" &> /dev/null; then
        sh_info "Installing pv..."
        if type "brew" &> /dev/null; then
            brew install pv
        elif type "apt-get" &> /dev/null; then
            sudo apt-get -y install pv
        elif type "yum" &> /dev/null; then
            sudo yum install pv
        fi
    fi

    if type "pv" &> /dev/null; then
        sh_success "$(pv --version) installed: $(command -v pv)"
    fi
}
install_pv
