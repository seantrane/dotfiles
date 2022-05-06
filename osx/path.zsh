#!/usr/bin/env bash

# coreutils support:
if type "brew" &> /dev/null && [[ "$(brew ls --versions coreutils)" ]]; then
  export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
fi

# openssl support:
if type "brew" &> /dev/null && [[ "$(brew ls --versions openssl)" ]]; then
  export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

  export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
  export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
  export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"
fi

# MAMP support:
if [[ -d "/Applications/MAMP/Library/bin" ]]; then
  export PATH="/Applications/MAMP/Library/bin:$PATH"
fi
