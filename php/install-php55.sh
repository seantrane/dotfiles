#!/usr/bin/env bash
#
# Install PHP 5.5.*
#
# This installs PHP and common extensions.

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if type "brew" &> /dev/null; then

    if [ ! "$(brew ls --versions php55)" ]; then
        sh_info "Installing PHP 5.5..."
        brew install php55 --with-gmp
    else
        sh_success "$(brew ls --versions php55) installed: $(command -v php)"
    fi

    sh_info "Installing primary PHP extensions/modules..."

    [[ ! "$(brew ls --versions php55-geoip)" ]] && brew install php55-geoip
    [[ ! "$(brew ls --versions php55-intl)" ]] && brew install php55-intl
    [[ ! "$(brew ls --versions php55-mcrypt)" ]] && brew install php55-mcrypt
    [[ ! "$(brew ls --versions php55-pspell)" ]] && brew install php55-pspell
    [[ ! "$(brew ls --versions php55-ssh2)" ]] && brew install php55-ssh2

    sh_info "Installing PHP storage/cache extensions/modules..."

    [[ ! "$(brew ls --versions php55-memcached)" ]] && brew install php55-memcached
    [[ ! "$(brew ls --versions php55-mongodb)" ]] && brew install php55-mongodb
    [[ ! "$(brew ls --versions php55-opcache)" ]] && brew install php55-opcache
    [[ ! "$(brew ls --versions php55-pdo-pgsql)" ]] && brew install php55-pdo-pgsql
    [[ ! "$(brew ls --versions php55-redis)" ]] && brew install php55-redis
    # [[ ! "$(brew ls --versions php55-xcache)" ]] && brew install php55-xcache

    sh_info "Installing PHP utility extensions/modules..."

    # [[ ! "$(brew ls --versions php55-suhosin)" ]] && brew install php55-suhosin
    # [[ ! "$(brew ls --versions php55-tidy)" ]] && brew install php55-tidy
    [[ ! "$(brew ls --versions php55-xdebug)" ]] && brew install php55-xdebug

    sh_info "Installing PHP media extensions/modules..."

    [[ ! "$(brew ls --versions php55-imagick)" ]] && brew install php55-imagick
    # [[ ! "$(brew ls --versions php55-pdflib)" ]] && brew install php55-pdflib

    sh_info "Installing PHP PEAR/PECL extensions/modules..."

    [[ ! "$(brew ls --versions php55-raphf)" ]] && brew install php55-raphf
    [[ ! "$(brew ls --versions php55-propro)" ]] && brew install php55-propro
    [[ ! "$(brew ls --versions php55-http)" ]] && brew install php55-http
    [[ ! "$(brew ls --versions php55-oauth)" ]] && brew install php55-oauth
    [[ ! "$(brew ls --versions php55-yaml)" ]] && brew install php55-yaml

    sh_info "Re-installing PHP to avoid errors..."
    brew reinstall php55 --with-gmp

fi
