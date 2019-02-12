#!/usr/bin/env bash
#
# Install Python

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "python" &> /dev/null; then
    sh_info "Installing Python..."
    if type "brew" &> /dev/null; then
        brew install python
        # If you switch to the brewed Python, then reinstall all formulae with python bindings
        # See: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Homebrew-and-Python.md#homebrew-provided-python-bindings
        brew reinstall pyside wxwidgets pygtk pygobject opencv vtk boost-python
    elif type "apt-get" &> /dev/null; then
        sudo apt-get -y install python
    elif type "yum" &> /dev/null; then
        sudo yum install python
    fi
fi

if type "python" &> /dev/null; then
    sh_success "$(python --version) installed: $(command -v python)"
fi
