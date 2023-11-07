# shellcheck shell=bash
#
# PATH inclusions

###############################################################################
# 'nix
###############################################################################

# coreutils support:
if [[ -d "${HOMEBREW_PREFIX:-/usr/local}/opt/coreutils/libexec/gnubin" ]]; then
  export PATH="${HOMEBREW_PREFIX:-/usr/local}/opt/coreutils/libexec/gnubin:$PATH"
fi

# openssl support:
if [[ -d "${HOMEBREW_PREFIX:-/usr/local}/opt/openssl@3/bin" ]]; then
  # If you need to have openssl@3 first in your PATH run:
  export PATH="${HOMEBREW_PREFIX:-/usr/local}/opt/openssl@3/bin:$PATH"
  # For compilers to find openssl@3 you may need to set:
  [[ -d "${HOMEBREW_PREFIX:-/usr/local}/opt/openssl@3/lib" ]] && export LDFLAGS="-L${HOMEBREW_PREFIX:-/usr/local}/opt/openssl@3/lib"
  [[ -d "${HOMEBREW_PREFIX:-/usr/local}/opt/openssl@3/include" ]] && export CPPFLAGS="-I${HOMEBREW_PREFIX:-/usr/local}/opt/openssl@3/include"
  # For pkg-config to find openssl@3 you may need to set:
  [[ -d "${HOMEBREW_PREFIX:-/usr/local}/opt/openssl@3/lib/pkgconfig" ]] && export PKG_CONFIG_PATH="${HOMEBREW_PREFIX:-/usr/local}/opt/openssl@3/lib/pkgconfig"
elif [[ -d "${HOMEBREW_PREFIX:-/usr/local}/opt/openssl@1.1/bin" ]]; then
  # If you need to have openssl@1.1 first in your PATH run:
  export PATH="${HOMEBREW_PREFIX:-/usr/local}/opt/openssl@1.1/bin:$PATH"
  # For compilers to find openssl@1.1 you may need to set:
  [[ -d "${HOMEBREW_PREFIX:-/usr/local}/opt/openssl@1.1/lib" ]] && export LDFLAGS="-L${HOMEBREW_PREFIX:-/usr/local}/opt/openssl@1.1/lib"
  [[ -d "${HOMEBREW_PREFIX:-/usr/local}/opt/openssl@1.1/include" ]] && export CPPFLAGS="-I${HOMEBREW_PREFIX:-/usr/local}/opt/openssl@1.1/include"
  # For pkg-config to find openssl@1.1 you may need to set:
  [[ -d "${HOMEBREW_PREFIX:-/usr/local}/opt/openssl@1.1/lib/pkgconfig" ]] && export PKG_CONFIG_PATH="${HOMEBREW_PREFIX:-/usr/local}/opt/openssl@1.1/lib/pkgconfig"
fi

###############################################################################
# Elixir / Erlang
###############################################################################

[[ -d "${HOMEBREW_PREFIX:-/usr/local}/opt/erlang" ]] && export MANPATH="${HOMEBREW_PREFIX:-/usr/local}/opt/erlang/lib/erlang/man:$MANPATH"

###############################################################################
# Git
###############################################################################

[[ -d "${HOMEBREW_PREFIX:-/usr/local}/opt/git/man" ]] && export MANPATH="${HOMEBREW_PREFIX:-/usr/local}/opt/git/man:$MANPATH"

###############################################################################
# Go
###############################################################################

if type "go" &> /dev/null; then
  mkdir -p "$HOME"/go/{bin,src,pkg}
  # ls -al "$HOME/go"
  export GOPATH="$HOME/go"

  [[ -d "${HOMEBREW_PREFIX:-/usr/local}/opt/golang/libexec" ]] && export GOROOT="${HOMEBREW_PREFIX:-/usr/local}/opt/golang/libexec"
  [[ -d "${GOPATH:-$HOME/go}/bin" ]] && export PATH="$PATH:${GOPATH:-$HOME/go}/bin"
  [[ -d "${GOROOT:-$HOME/go}/bin" ]] && export PATH="$PATH:${GOROOT:-$HOME/go}/bin"
fi

###############################################################################
# Java
###############################################################################

if [[ -d "${HOMEBREW_PREFIX:-/usr/local}/opt/openjdk/bin" ]]; then
  # For the system Java wrappers to find this JDK, symlink it with:
  if [[ ! -e "/Library/Java/JavaVirtualMachines/openjdk.jdk" ]] && [[ -d "/Library/Java/JavaVirtualMachines" ]] && [[ -e "${HOMEBREW_PREFIX:-/usr/local}/opt/openjdk/libexec/openjdk.jdk" ]]; then
    sudo ln -sfn ${HOMEBREW_PREFIX:-/usr/local}/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
  fi

  # openjdk is keg-only, which means it was not symlinked into $(brew --prefix),
  # because macOS provides similar software and installing this software in
  # parallel can cause all kinds of trouble.

  # To have openjdk first in your PATH:
  [[ -d "${HOMEBREW_PREFIX:-/usr/local}/opt/openjdk/bin" ]] && export PATH="${HOMEBREW_PREFIX:-/usr/local}/opt/openjdk/bin:$PATH"

  # For compilers to find openjdk you may need to set:
  [[ -e "${HOMEBREW_PREFIX:-/usr/local}/opt/openjdk/include" ]] && export CPPFLAGS="-I${HOMEBREW_PREFIX:-/usr/local}/opt/openjdk/include"
fi

###############################################################################
# MySQL
###############################################################################

# MySQL-manual:
[[ -d "${HOMEBREW_PREFIX:-/usr/local}/opt/mysql/man" ]] && export MANPATH="${HOMEBREW_PREFIX:-/usr/local}/opt/mysql/man:$MANPATH"

###############################################################################
# Node.js
###############################################################################

# .node bin:
[[ -d "$HOME/.node/bin" ]] && export PATH="$HOME/.node/bin:$PATH"

# .node node_modules:
[[ -d "$HOME/.node/lib/node_modules" ]] && export NODE_PATH="$HOME/.node/lib/node_modules:$NODE_PATH"

# If Homebrew has NOT installed npm, you should supplement
# your NODE_PATH with the npm module folder:
if [[ -d "${HOMEBREW_PREFIX:-/usr}/lib/node_modules" ]]; then
  export NODE_PATH="${HOMEBREW_PREFIX:-/usr}/lib/node_modules:$NODE_PATH"
fi

###############################################################################
# Ruby
###############################################################################

if [[ -d "${HOMEBREW_PREFIX:-/usr/local}/opt/ruby/bin" ]]; then
  # If you need to have ruby first in your PATH run:
  export PATH="${HOMEBREW_PREFIX:-/usr/local}/opt/ruby/bin:$PATH"
  # For compilers to find ruby you may need to set:
  [[ -d "${HOMEBREW_PREFIX:-/usr/local}/opt/ruby/lib" ]] && export LDFLAGS="-L${HOMEBREW_PREFIX:-/usr/local}/opt/ruby/lib"
  [[ -d "${HOMEBREW_PREFIX:-/usr/local}/opt/ruby/include" ]] && export CPPFLAGS="-I${HOMEBREW_PREFIX:-/usr/local}/opt/ruby/include"
  # For pkg-config to find ruby you may need to set:
  [[ -d "${HOMEBREW_PREFIX:-/usr/local}/opt/ruby/lib/pkgconfig" ]] && export PKG_CONFIG_PATH="${HOMEBREW_PREFIX:-/usr/local}/opt/ruby/lib/pkgconfig"

  # By default, binaries installed by gem will be placed into:
  _find_files_array=($(find -H "${HOMEBREW_PREFIX:-}/lib/ruby/gems" -maxdepth 2 -perm -u+r -type d -name 'bin'))
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
[[ -d "/${HOMEBREW_PREFIX:-/usr/local}/opt/terraform/bin" ]] && export PATH="/${HOMEBREW_PREFIX:-/usr/local}/opt/terraform/bin:$PATH"

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
