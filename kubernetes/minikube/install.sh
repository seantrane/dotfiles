#!/usr/bin/env bash
#
# Install Minikube

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "minikube" &> /dev/null; then
    sh_info "Installing Minikube..."
    sh_info "If you do not already have a hypervisor installed, install VirtualBox."
    if type "brew" &> /dev/null; then
        brew install minikube
    elif type "apt-get" &> /dev/null; then
        # sudo apt-get update
        sudo apt-get -y install minikube
    elif type "yum" &> /dev/null; then
        sudo yum install minikube
    fi
fi

if type "minikube" &> /dev/null; then
    sh_success "$(minikube --version) installed: $(command -v minikube)"
fi
