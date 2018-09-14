#!/usr/bin/env bash
#
# Install Elixir/Erlang

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "elixir" &> /dev/null; then
    sh_info "Installing Elixir/Erlang..."
    if type "brew" &> /dev/null; then
        brew install elixir
    elif type "apt-get" &> /dev/null; then
        sudo apt-get -y install elixir
    elif type "yum" &> /dev/null; then
        sudo yum install elixir
    fi
fi

if type "elixir" &> /dev/null; then
    sh_success "$(elixir --version) installed: $(which elixir)"
fi
