#!/usr/bin/env bash
#
# Installing shims for all Ruby executables known to rbenv

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

if type "rbenv" &> /dev/null; then
    sh_info "Installing shims for all Ruby executables known to rbenv..."
    rbenv rehash
fi
