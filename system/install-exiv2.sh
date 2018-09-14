#!/usr/bin/env bash
#
# exiv2
# EXIF and IPTC metadata manipulation library and tools
# http://www.exiv2.org

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

install_exiv2 () {
    if ! type "exiv2" &> /dev/null; then
        sh_info "Installing exiv2..."
        if type "brew" &> /dev/null; then
            brew install exiv2
        elif type "apt-get" &> /dev/null; then
            sudo apt-get -y install exiv2
        elif type "yum" &> /dev/null; then
            sudo yum install exiv2
        fi
    fi

    if type "exiv2" &> /dev/null; then
        sh_success "$(exiv2 --version) installed: $(which exiv2)"
    fi
}
install_exiv2
