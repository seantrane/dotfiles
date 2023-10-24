#!/usr/bin/env bash

# For the system Java wrappers to find this JDK, symlink it with:
if [[ ! -e "/Library/Java/JavaVirtualMachines/openjdk.jdk" ]] && [[ -d "/Library/Java/JavaVirtualMachines" ]] && [[ -e "$(brew --prefix openjdk)/libexec/openjdk.jdk" ]]; then
  sudo ln -sfn $(brew --prefix openjdk)/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
fi

# openjdk is keg-only, which means it was not symlinked into $(brew --prefix),
# because macOS provides similar software and installing this software in
# parallel can cause all kinds of trouble.

# To have openjdk first in your PATH:
if [[ -d "$(brew --prefix openjdk)/bin" ]]; then
  export PATH="$(brew --prefix openjdk)/bin:$PATH"
fi

# For compilers to find openjdk you may need to set:
if [[ -e "$(brew --prefix openjdk)/include" ]]; then
  export CPPFLAGS="-I$(brew --prefix openjdk)/include"
fi
