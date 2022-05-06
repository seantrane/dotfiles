#!/usr/bin/env bash
#
# Install OpenJDK.

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "java" &> /dev/null || [[ "$OSTYPE" == "darwin"* ]]; then
  sh_info "Installing OpenJDK..."
  if type "brew" &> /dev/null; then
    brew install java
  fi
fi

# Help system find OpenJDK by loading paths
. "$( cd "${BASH_SOURCE%/*}" && pwd )/path.zsh"

if type "java" &> /dev/null; then
  sh_success "$(java -version) installed: $(command -v java)"
fi
