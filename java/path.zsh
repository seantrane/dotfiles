#!/usr/bin/env bash

# For the system Java wrappers to find this JDK, symlink it with:
if [[ ! -e "/Library/Java/JavaVirtualMachines/openjdk.jdk" ]] && [[ -d "/Library/Java/JavaVirtualMachines" ]] && [[ -e "/usr/local/opt/openjdk/libexec/openjdk.jdk" ]]; then
  sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
fi

# openjdk is keg-only, which means it was not symlinked into /usr/local,
# because macOS provides similar software and installing this software in
# parallel can cause all kinds of trouble.

# To have openjdk first in your PATH:
if [[ -d "/usr/local/opt/openjdk/bin" ]]; then
  export PATH="/usr/local/opt/openjdk/bin:$PATH"
fi

# For compilers to find openjdk you may need to set:
if [[ -e "/usr/local/opt/openjdk/include" ]]; then
  export CPPFLAGS="-I/usr/local/opt/openjdk/include"
fi
