#!/usr/bin/env bash
#
# Install PHPUnit
# https://phpunit.de

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "phpunit" &> /dev/null; then
    sh_info "Installing PHPUnit..."
    if type "brew" &> /dev/null; then
        brew install phpunit
        #brew install phpunit-skeleton-generator
    elif type "composer" &> /dev/null; then
        composer global require "phpunit/phpunit"
    elif type "apt-get" &> /dev/null; then
        wget https://phar.phpunit.de/phpunit.phar
        chmod +x phpunit.phar
        sudo mv phpunit.phar /usr/bin/phpunit
    fi
fi

if type "phpunit" &> /dev/null; then
    sh_success "PHPUnit $(phpunit --version) installed: $(command -v phpunit)"
fi
