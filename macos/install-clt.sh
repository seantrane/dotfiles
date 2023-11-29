#!/usr/bin/env bash
#
# Install Command Line Tools for Xcode

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if [[ "$OSTYPE" == "darwin"* ]]; then
  if type "xcode-select" &> /dev/null; then
    XCODE_PATH=$(xcode-select -p)
    if [[ "$XCODE_PATH" == "/Applications/Xcode.app"* ]]; then
      sh_success "Xcode is installed:"
      sh_text "${XCODE_PATH}"
      sh_alert "You should ensure Xcode is updated to the newest version."
      sh_text "Launch the App Store application, check 'Updates', update Xcode."
      sh_text "After updating Xcode, be sure to launch the Xcode application and accept the Apple license terms."
    elif [[ "$XCODE_PATH" == "/Library/Developer/CommandLineTools"* ]]; then
      sh_success "Xcode Command Line Tools are installed:"
      sh_text "${XCODE_PATH}"
    else
      sh_info "Installing Xcode Command Line Tools..."
      xcode-select --install
    fi
  else
    sh_error "The 'xcode-select' command was not available."
    sh_alert "You should install Xcode (and Command Line Tools)."
    sh_text "Launch the App Store application, search-for and install Xcode."
    sh_text "After installing Xcode, be sure to launch the Xcode application and accept the Apple license terms."
    sh_fail "This operation requires Xcode Command Line Tools."
  fi
  # Check gcc for successful installation.
  if type "gcc" &> /dev/null; then
    sh_success "gcc is installed. Check configuration:"
    echo
    gcc --version
    echo
  fi
fi
