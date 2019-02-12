#!/usr/bin/env bash
#
# Install Yarn

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "yarn" &> /dev/null; then
    sh_info "Installing Yarn..."
    if type "brew" &> /dev/null; then
        brew install yarn
    elif type "apt-get" &> /dev/null; then
        sudo apt-get -y install yarn
    elif type "yum" &> /dev/null; then
        sudo wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo
        if ! type "node" &> /dev/null; then
            curl --silent --location https://rpm.nodesource.com/setup_6.x | sudo bash -
        fi
        sudo yum install yarn
    elif type "apk" &> /dev/null; then
        apk add yarn
    fi
fi

if type "yarn" &> /dev/null; then
    sh_success "$(yarn --version) installed: $(command -v yarn)"
fi
