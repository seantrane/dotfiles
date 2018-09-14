#!/usr/bin/env bash
#
# Check gems are up to date without installing documentation

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if type "gem" &> /dev/null; then
    sh_info "Updating Ruby gems..."
    gem update --system --no-document
fi
