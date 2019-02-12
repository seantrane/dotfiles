#!/usr/bin/env bash
#
# Install wget
#
# This installs `wget` with IRI support using Homebrew.

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "wget" &> /dev/null; then
    sh_info "Installing GNU Wget with IRI support..."
    if type "brew" &> /dev/null; then
        brew install wget --with-iri
    elif type "apt-get" &> /dev/null; then
        sudo apt-get -y install wget --with-iri
    elif type "yum" &> /dev/null; then
        sudo yum install wget --with-iri
    fi
fi

if type "wget" &> /dev/null; then
    sh_success "$(wget --version) installed: $(command -v wget)"
fi
