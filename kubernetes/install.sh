#!/usr/bin/env bash
#
# Install Kubernetes

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "kubectl" &> /dev/null; then
    sh_info "Installing Kubernetes..."
    if type "brew" &> /dev/null; then
        brew install kubectl
    elif type "apt-get" &> /dev/null; then
        sudo apt-get update && sudo apt-get install -y apt-transport-https
        curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
        echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
        sudo apt-get update
        sudo apt-get -y install kubectl
    elif type "yum" &> /dev/null; then
        cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
        sudo yum install kubectl
    fi
fi

if type "kubectl" &> /dev/null; then
    sh_success "$(kubectl --version) installed: $(command -v kubectl)"
fi
