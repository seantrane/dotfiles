#!/usr/bin/env bash
#
# ImageMagick (convert)
# Tools and libraries to manipulate images in many formats
# https://www.imagemagick.org

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

install_imagemagick () {
    if ! type "imagemagick" &> /dev/null; then
        sh_info "Installing ImageMagick (convert)..."
        if type "brew" &> /dev/null; then
            brew install imagemagick
        elif type "apt-get" &> /dev/null; then
            sudo apt-get -y install imagemagick
        elif type "yum" &> /dev/null; then
            sudo yum install imagemagick
        fi
    fi

    if type "convert" &> /dev/null; then
        sh_success "$(convert --version) installed: $(command -v convert)"
    fi
}
install_imagemagick
