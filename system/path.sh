#!/usr/bin/env bash

###############################################################################
# 'nix
###############################################################################

# coreutils support:
if [[ -d "${BREW_PATH:-}/coreutils/libexec/gnubin" ]]; then
  export PATH="${BREW_PATH:-}/coreutils/libexec/gnubin:$PATH"
fi

# openssl support:
if [[ -d "${BREW_PATH:-}/openssl@1.1/bin" ]]; then
  # If you need to have openssl@1.1 first in your PATH run:
  export PATH="${BREW_PATH:-}/openssl@1.1/bin:$PATH"
  # For compilers to find openssl@1.1 you may need to set:
  [[ -d "${BREW_PATH:-}/openssl@1.1/lib" ]] && export LDFLAGS="-L${BREW_PATH:-}/openssl@1.1/lib"
  [[ -d "${BREW_PATH:-}/openssl@1.1/include" ]] && export CPPFLAGS="-I${BREW_PATH:-}/openssl@1.1/include"
  # For pkg-config to find openssl@1.1 you may need to set:
  [[ -d "${BREW_PATH:-}/openssl@1.1/lib/pkgconfig" ]] && export PKG_CONFIG_PATH="${BREW_PATH:-}/openssl@1.1/lib/pkgconfig"
fi

###############################################################################
# Elixir / Erlang
###############################################################################

[[ -d "${BREW_PATH:-/usr/bin}/erlang" ]] && export MANPATH="${BREW_PATH:-/usr/bin}/erlang/lib/erlang/man:$MANPATH"

###############################################################################
# Git
###############################################################################

[[ -d "${BREW_PATH:-/usr/bin}/git/man" ]] && export MANPATH="${BREW_PATH:-/usr/bin}/git/man:$MANPATH"

###############################################################################
# Go
###############################################################################

if type "go" &> /dev/null; then
  mkdir -p "$HOME"/go/{bin,src,pkg}
  # ls -al "$HOME/go"
  export GOPATH="$HOME/go"

  [[ -d "${BREW_PATH:-/usr/bin}/golang/libexec" ]] && export GOROOT="${BREW_PATH:-/usr/bin}/golang/libexec"
  [[ -d "${GOPATH:-$HOME/go}/bin" ]] && export PATH="$PATH:${GOPATH:-$HOME/go}/bin"
  [[ -d "${GOROOT:-$HOME/go}/bin" ]] && export PATH="$PATH:${GOROOT:-$HOME/go}/bin"
fi

###############################################################################
# Java
###############################################################################

if [[ -d "${BREW_PATH:-}/openjdk/bin" ]]; then
  # For the system Java wrappers to find this JDK, symlink it with:
  if [[ ! -e "/Library/Java/JavaVirtualMachines/openjdk.jdk" ]] && [[ -d "/Library/Java/JavaVirtualMachines" ]] && [[ -e "${BREW_PATH:-}/openjdk/libexec/openjdk.jdk" ]]; then
    sudo ln -sfn ${BREW_PATH:-}/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
  fi

  # openjdk is keg-only, which means it was not symlinked into $(brew --prefix),
  # because macOS provides similar software and installing this software in
  # parallel can cause all kinds of trouble.

  # To have openjdk first in your PATH:
  [[ -d "${BREW_PATH:-}/openjdk/bin" ]] && export PATH="${BREW_PATH:-}/openjdk/bin:$PATH"

  # For compilers to find openjdk you may need to set:
  [[ -e "${BREW_PATH:-}/openjdk/include" ]] && export CPPFLAGS="-I${BREW_PATH:-}/openjdk/include"
fi

###############################################################################
# MySQL
###############################################################################

# MySQL-manual:
[[ -d "${BREW_PATH:-}/mysql/man" ]] && export MANPATH="${BREW_PATH:-}/mysql/man:$MANPATH"

###############################################################################
# Node.js
###############################################################################

# .node bin:
[[ -d "$HOME/.node/bin" ]] && export PATH="$HOME/.node/bin:$PATH"

# .node node_modules:
[[ -d "$HOME/.node/lib/node_modules" ]] && export NODE_PATH="$HOME/.node/lib/node_modules:$NODE_PATH"

# If Homebrew has NOT installed npm, you should supplement
# your NODE_PATH with the npm module folder:
if [[ -d "${BREW_PREFIX:-/usr}/lib/node_modules" ]]; then
  export NODE_PATH="${BREW_PREFIX:-/usr}/lib/node_modules:$NODE_PATH"
fi

###############################################################################
# Ruby
###############################################################################

if [[ -d "${BREW_PATH:-}/ruby/bin" ]]; then
  # If you need to have ruby first in your PATH run:
  export PATH="${BREW_PATH:-}/ruby/bin:$PATH"
  # For compilers to find ruby you may need to set:
  [[ -d "${BREW_PATH:-}/ruby/lib" ]] && export LDFLAGS="-L${BREW_PATH:-}/ruby/lib"
  [[ -d "${BREW_PATH:-}/ruby/include" ]] && export CPPFLAGS="-I${BREW_PATH:-}/ruby/include"
  # For pkg-config to find ruby you may need to set:
  [[ -d "${BREW_PATH:-}/ruby/lib/pkgconfig" ]] && export PKG_CONFIG_PATH="${BREW_PATH:-}/ruby/lib/pkgconfig"

  # By default, binaries installed by gem will be placed into:
  _find_files_array=($(find -H "${BREW_PREFIX:-}/lib/ruby/gems" -maxdepth 2 -perm -u+r -type d -name 'bin'))
  for _file_path in "${_find_files_array[@]}"; do
    export PATH="$_file_path:$PATH"
  done
  unset _file_path _find_files_array
fi

_find_files_array=($(find -H "$HOME/.gem/ruby" -maxdepth 2 -perm -u+r -type d -name 'bin'))
for _file_path in "${_find_files_array[@]}"; do
  export PATH="$_file_path:$PATH"
done
unset _file_path _find_files_array

# rbenv + ruby-build:
if [[ -d "$HOME/.rbenv" ]]; then
  export PATH="$HOME/.rbenv/shims:$PATH"
  export PATH="$HOME/.rbenv/bin:$PATH"
  export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
fi

###############################################################################
# PHP / Composer
###############################################################################

[[ -d "$HOME/.composer/vendor/bin" ]] && export PATH="$HOME/.composer/vendor/bin:$PATH"

###############################################################################
# Terraform
###############################################################################

[[ -d "$HOME/terraform" ]] && export PATH="$HOME/terraform:$PATH"
[[ -d "/${BREW_PATH:-/usr/bin}/terraform/bin" ]] && export PATH="/${BREW_PATH:-/usr/bin}/terraform/bin:$PATH"

###############################################################################
# Yarn
###############################################################################

type "yarn" &> /dev/null && export PATH="$(yarn global bin):$PATH"

###############################################################################
# Homebrew
###############################################################################

# Add Linuxbrew PATHs (to your .bashrc or .zshrc):
if [[ -d "$HOME/.linuxbrew" ]]; then
  export PATH="$HOME/.linuxbrew/bin:$PATH"
  export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
  export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
fi

# Keep this at bottom so that Homebrew-install binaries take precedent.
export PATH="/opt/homebrew/bin:$PATH"
