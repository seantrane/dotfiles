#!/usr/bin/env bash
#
# Install Vault

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "vault" &> /dev/null; then
    sh_info "Installing Vault..."
    if type "brew" &> /dev/null; then
        brew install vault
    fi
fi

if type "vault" &> /dev/null; then
    sh_success "$(vault --version) installed: $(command -v vault)"
fi
