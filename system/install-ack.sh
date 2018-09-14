#!/usr/bin/env bash
#
# ack
# Search tool like grep, but optimized for programmers
# http://beyondgrep.com

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

install_ack () {
    if ! type "ack" &> /dev/null; then
        sh_info "Installing ack..."
        if type "brew" &> /dev/null; then
            brew install ack
        elif type "apt-get" &> /dev/null; then
            sudo apt-get -y install ack
        elif type "yum" &> /dev/null; then
            sudo yum install ack
        fi
    fi

    if type "ack" &> /dev/null; then
        sh_success "$(ack --version) installed: $(which ack)"
    fi
}
install_ack
