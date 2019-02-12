#!/usr/bin/env bash
#
# ssh-copy-id
# Add a public key to a remote machine's authorized_keys file
# http://www.openssh.com

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

install_sshcopyid () {
    if ! type "ssh-copy-id" &> /dev/null; then
        sh_info "Installing ssh-copy-id..."
        if type "brew" &> /dev/null; then
            brew install ssh-copy-id
        elif type "apt-get" &> /dev/null; then
            sudo apt-get -y install ssh-copy-id
        elif type "yum" &> /dev/null; then
            sudo yum install ssh-copy-id
        fi
    fi

    if type "ssh-copy-id" &> /dev/null; then
        sh_success "$(ssh-copy-id --version) installed: $(command -v ssh-copy-id)"
    fi
}
install_sshcopyid
