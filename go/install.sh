#!/usr/bin/env bash
#
# Install Go.

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "go" &> /dev/null || [[ "$OSTYPE" == "darwin"* ]]; then
  sh_info "Installing Go..."
  if type "brew" &> /dev/null; then
    brew install go
  elif type "apt-get" &> /dev/null; then
    sudo apt-get -y install go
  elif type "yum" &> /dev/null; then
    sudo yum install go
  fi
fi

if type "go" &> /dev/null; then
  sh_success "$(go version) installed: $(command -v go)"

  sh_info "Setting up Go workspace file structure (~/go)..."
  mkdir -p "$HOME"/go/{bin,src,pkg}
  ls -al "$HOME/go"
fi
