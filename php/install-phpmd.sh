#!/usr/bin/env bash
#
# Install PHP Mess Detector
# http://phpmd.org

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

if ! type "phpmd" &> /dev/null; then
    sh_info "Installing PHP Mess Detector..."
    if type "brew" &> /dev/null; then
        brew install phpmd
    fi
fi

if type "phpmd" &> /dev/null; then
    sh_success "PHP Mess Detector $(phpmd --version) installed: $(which phpmd)"
fi
