#!/usr/bin/env bash
#
# Install Composer.

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

if ! type "composer" &> /dev/null; then
    sh_info "Installing Composer..."
    curl -sS https://getcomposer.org/installer | php
    # mkdir:/usr/local/bin, if it does not exist yet
    # using sudo to bypass any issues
    sudo mkdir /usr
    sudo mkdir /usr/local
    sudo mkdir /usr/local/bin
    sudo mv composer.phar /usr/local/bin/composer
else
    sh_info "Updating Composer..."
    composer self-update
fi

if type "composer" &> /dev/null; then
    sh_success "$(composer --version) installed: $(which composer)"
fi
