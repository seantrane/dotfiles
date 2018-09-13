#!/usr/bin/env bash
#
# Install Symfony.

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

if ! type "symfony" &> /dev/null; then
    sh_info "Installing Symfony..."
    [[ ! -d /usr ]] && sudo mkdir /usr
    [[ ! -d /usr/local ]] && sudo mkdir /usr/local
    [[ ! -d /usr/local/bin ]] && sudo mkdir /usr/local/bin
    sudo curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
    sudo chmod a+x /usr/local/bin/symfony
else
    symfony self-update
fi

if type "symfony" &> /dev/null; then
    sh_success "$(symfony --version) installed: $(which symfony)"
fi
