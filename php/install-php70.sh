#!/usr/bin/env bash
#
# Install PHP 7.0.*
#
# This installs PHP and common extensions.

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

if type "brew" &> /dev/null; then

    if [ ! "$(brew ls --versions php70)" ]; then
        sh_info "Installing PHP 7.0..."
        brew install php70 --with-gmp
    else
        sh_success "$(brew ls --versions php70) installed: $(which php)"
    fi

    sh_info "Installing primary PHP extensions/modules..."

    # [[ ! "$(brew ls --versions php70-geoip)" ]] && brew install php70-geoip
    [[ ! "$(brew ls --versions php70-intl)" ]] && brew install php70-intl
    [[ ! "$(brew ls --versions php70-mcrypt)" ]] && brew install php70-mcrypt
    [[ ! "$(brew ls --versions php70-pspell)" ]] && brew install php70-pspell

    sh_info "Installing PHP storage/cache extensions/modules..."

    [[ ! "$(brew ls --versions php70-memcached)" ]] && brew install php70-memcached
    [[ ! "$(brew ls --versions php70-opcache)" ]] && brew install php70-opcache
    [[ ! "$(brew ls --versions php70-pdo-pgsql)" ]] && brew install php70-pdo-pgsql
    [[ ! "$(brew ls --versions php70-redis)" ]] && brew install php70-redis

    sh_info "Installing PHP utility extensions/modules..."

    [[ ! "$(brew ls --versions php70-xdebug)" ]] && brew install php70-xdebug

    sh_info "Installing PHP media extensions/modules..."

    [[ ! "$(brew ls --versions php70-imagick)" ]] && brew install php70-imagick

    sh_info "Installing PHP PEAR/PECL extensions/modules..."

    # [[ ! "$(brew ls --versions php70-raphf)" ]] && brew install php70-raphf
    # [[ ! "$(brew ls --versions php70-propro)" ]] && brew install php70-propro
    # [[ ! "$(brew ls --versions php70-http)" ]] && brew install php70-http
    # [[ ! "$(brew ls --versions php70-oauth)" ]] && brew install php70-oauth
    [[ ! "$(brew ls --versions php70-yaml)" ]] && brew install php70-yaml
    
    sh_info "Re-installing PHP to avoid errors..."
    brew reinstall php70 --with-gmp

fi
