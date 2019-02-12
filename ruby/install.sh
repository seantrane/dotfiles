#!/usr/bin/env bash
#
# Install Ruby et.al.

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

# Install Ruby-dependencies for Debian-based systems
if type "apt-get" &> /dev/null; then
    sudo apt-get update
    sh_info "Installing some dependencies for Ruby..."
    sudo apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
fi

# Install Ruby-environment (rbenv)
! type "rbenv" &> /dev/null && . "$DOTFILES/rbenv/install.sh"

# Install Ruby
if type "rbenv" &> /dev/null; then
    sh_info "Installing Ruby..."
    rbenv install 2.5.3
    rbenv global 2.5.3
fi

# Install Bundler on Linux systems
# http://bundler.io
# Recommended by: https://gorails.com/setup
if ! type "bundler" &> /dev/null; then
    if type "gem" &> /dev/null && [[ "$OSTYPE" == "linux-gnu" ]]; then
        sh_info "Installing Bundler (http://bundler.io)..."
        sh_note "Recommended by: https://gorails.com/setup"
        gem install bundler
        if type "bundler" &> /dev/null; then
            sh_success "$(bundler --version) installed: $(command -v bundler)"
        fi
    fi
fi

if type "ruby" &> /dev/null; then
    sh_success "$(ruby --version) installed: $(command -v ruby)"
fi
