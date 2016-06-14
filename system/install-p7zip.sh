#!/usr/bin/env bash
#
# p7zip
# 7-Zip (high compression file archiver) implementation
# http://p7zip.sourceforge.net

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

install_p7zip () {
    if ! type "p7zip" &> /dev/null; then
        sh_info "Installing p7zip..."
        if type "brew" &> /dev/null; then
            brew install p7zip
        elif type "apt-get" &> /dev/null; then
            sudo apt-get -y install p7zip
        elif type "yum" &> /dev/null; then
            sudo yum install p7zip
        fi
    fi

    if type "p7zip" &> /dev/null; then
        sh_success "$(p7zip --version) installed: $(which p7zip)"
    fi
}
install_p7zip
