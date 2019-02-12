#!/usr/bin/env bash
#
# rename
# Perl-powered file rename script with many helpful built-ins
# http://plasmasturm.org/code/rename

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

install_rename () {
    if ! type "rename" &> /dev/null; then
        sh_info "Installing rename..."
        if type "brew" &> /dev/null; then
            brew install rename
        elif type "apt-get" &> /dev/null; then
            sudo apt-get -y install rename
        elif type "yum" &> /dev/null; then
            sudo yum install rename
        fi
    fi

    if type "rename" &> /dev/null; then
        sh_success "$(rename --version) installed: $(command -v rename)"
    fi
}
install_rename
