#!/usr/bin/env bash
#
# ShellCheck
# finds bugs in your shell scripts.
# https://www.shellcheck.net/
# https://github.com/koalaman/shellcheck

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

install_shellcheck () {
    if ! type "shellcheck" &> /dev/null; then
        sh_info "Installing shellcheck..."
        if type "brew" &> /dev/null; then
            brew install shellcheck
        elif type "apt-get" &> /dev/null; then
            sudo apt-get -y install shellcheck
        elif type "yum" &> /dev/null; then
            sudo yum install shellcheck
        fi
    fi

    if type "shellcheck" &> /dev/null; then
        sh_success "$(shellcheck --version) installed: $(command -v shellcheck)"
    fi
}
install_shellcheck
