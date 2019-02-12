#!/usr/bin/env bash
#
# Heroku CLI (heroku toolbelt)
# Everything you need to get started with Heroku
# https://toolbelt.heroku.com
# http://github.com/heroku/heroku

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "heroku" &> /dev/null; then
    sh_info "Installing Heroku CLI (heroku toolbelt)..."
    if type "brew" &> /dev/null; then
        brew install heroku-toolbelt
    elif type "apt-get" &> /dev/null; then
        wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
    else
        wget -O- https://toolbelt.heroku.com/install.sh | sh
    fi
fi

if type "heroku" &> /dev/null; then
    sh_success "$(heroku --version) installed: $(command -v heroku)"
fi
