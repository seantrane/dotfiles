#!/usr/bin/env bash
#
# Install Helm

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "helm" &> /dev/null; then
    sh_info "Installing Helm..."
    if type "brew" &> /dev/null; then
        brew install helm
    elif type "apt-get" &> /dev/null; then
        # sudo apt-get update
        sudo apt-get -y install helm
    elif type "yum" &> /dev/null; then
        sudo yum install helm
    fi
fi

if type "helm" &> /dev/null; then
    sh_success "$(helm --version) installed: $(command -v helm)"
fi
