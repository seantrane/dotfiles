#!/usr/bin/env bash
#
# Install PHP 5.6.*
#
# This installs PHP and common extensions.

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if type "brew" &> /dev/null; then

    if [ ! "$(brew ls --versions php56)" ]; then
        sh_info "Installing PHP 5.6..."
        brew install php56 --with-gmp
    else
        sh_success "$(brew ls --versions php56) installed: $(which php)"
    fi

    sh_info "Installing primary PHP extensions/modules..."

    [[ ! "$(brew ls --versions php56-geoip)" ]] && brew install php56-geoip
    [[ ! "$(brew ls --versions php56-intl)" ]] && brew install php56-intl
    [[ ! "$(brew ls --versions php56-mcrypt)" ]] && brew install php56-mcrypt
    [[ ! "$(brew ls --versions php56-pspell)" ]] && brew install php56-pspell
    [[ ! "$(brew ls --versions php56-ssh2)" ]] && brew install php56-ssh2

    sh_info "Installing PHP storage/cache extensions/modules..."

    [[ ! "$(brew ls --versions php56-memcached)" ]] && brew install php56-memcached
    [[ ! "$(brew ls --versions php56-mongodb)" ]] && brew install php56-mongodb
    [[ ! "$(brew ls --versions php56-opcache)" ]] && brew install php56-opcache
    [[ ! "$(brew ls --versions php56-pdo-pgsql)" ]] && brew install php56-pdo-pgsql
    [[ ! "$(brew ls --versions php56-redis)" ]] && brew install php56-redis
    # [[ ! "$(brew ls --versions php56-xcache)" ]] && brew install php56-xcache

    sh_info "Installing PHP utility extensions/modules..."

    [[ ! "$(brew ls --versions php56-suhosin)" ]] && brew install php56-suhosin
    # [[ ! "$(brew ls --versions php56-tidy)" ]] && brew install php56-tidy
    [[ ! "$(brew ls --versions php56-xdebug)" ]] && brew install php56-xdebug

    sh_info "Installing PHP media extensions/modules..."

    [[ ! "$(brew ls --versions php56-imagick)" ]] && brew install php56-imagick
    # [[ ! "$(brew ls --versions php56-pdflib)" ]] && brew install php56-pdflib

    sh_info "Installing PHP PEAR/PECL extensions/modules..."

    [[ ! "$(brew ls --versions php56-raphf)" ]] && brew install php56-raphf
    [[ ! "$(brew ls --versions php56-propro)" ]] && brew install php56-propro
    [[ ! "$(brew ls --versions php56-http)" ]] && brew install php56-http
    [[ ! "$(brew ls --versions php56-oauth)" ]] && brew install php56-oauth
    [[ ! "$(brew ls --versions php56-yaml)" ]] && brew install php56-yaml

    sh_info "Re-installing PHP to avoid errors..."
    brew reinstall php56 --with-gmp

fi
