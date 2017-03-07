#!/usr/bin/env bash
#
# Terraform
# https://www.terraform.io

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

if ! type "terraform" &> /dev/null; then
    sh_info "Installing Terraform..."
    if type "brew" &> /dev/null; then
        brew install terraform
    fi
fi

if type "terraform" &> /dev/null; then
    sh_success "$(terraform --version) installed: $(which terraform)"
fi
