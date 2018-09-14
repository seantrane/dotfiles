#!/usr/bin/env bash
#
# Install PHP
#
# This installs PHP and common extensions using Homebrew.

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

# Homebrew taps
if type "brew" &> /dev/null; then
    sh_info "Setting up Homebrew-PHP tap..."
    brew tap homebrew/homebrew-php
fi

DOTPHP=$( cd "${BASH_SOURCE%/*}" && pwd )

# Install PHP
installphp () {
    local action=
    sh_user "Which PHP version do you want to install?"
    sh_text "${Underline}a${Reset}) 5.5.* / ${Underline}b${Reset}) 5.6.* / ${Underline}c${Reset}) 7.0.*"
    read -r -n 1 action
    case "$action" in
        a ) # PHP 5.5.+
            [[ -s "$DOTPHP/install-php55.sh" ]] && source $DOTPHP/install-php55.sh
            ;;
        b ) # PHP 5.6.+
            [[ -s "$DOTPHP/install-php56.sh" ]] && source $DOTPHP/install-php56.sh
            ;;
        c ) # PHP 7.0.+
            [[ -s "$DOTPHP/install-php70.sh" ]] && source $DOTPHP/install-php70.sh
            ;;
        * )
            sh_alert "You elected not to install PHP."
            ;;
    esac
}
installphp

# https://github.com/squizlabs/PHP_CodeSniffer
[[ -s "$DOTPHP/install-phpcs.sh" ]] && source $DOTPHP/install-phpcs.sh

# http://cs.sensiolabs.org
#[[ -s "$DOTPHP/install-phpcsfixer.sh" ]] && source $DOTPHP/install-phpcsfixer.sh

# http://www.phpdoc.org
[[ -s "$DOTPHP/install-phpdoc.sh" ]] && source $DOTPHP/install-phpdoc.sh

# http://www.icosaedro.it/phplint/
#[[ -s "$DOTPHP/install-phplint.sh" ]] && source $DOTPHP/install-phplint.sh

# http://phpmd.org
[[ -s "$DOTPHP/install-phpmd.sh" ]] && source $DOTPHP/install-phpmd.sh

# http://www.phpmyadmin.net
[[ -s "$DOTPHP/install-phpmyadmin.sh" ]] && source $DOTPHP/install-phpmyadmin.sh

# http://www.phpsh.org
[[ -s "$DOTPHP/install-phpsh.sh" ]] && source $DOTPHP/install-phpsh.sh

# https://phpunit.de
[[ -s "$DOTPHP/install-phpunit.sh" ]] && source $DOTPHP/install-phpunit.sh
