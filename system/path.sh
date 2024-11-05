# shellcheck shell=bash
#
# PATH inclusions

[[ ! -d "${DOTFILES:-}" ]] && DOTFILES=$(cd "${BASH_SOURCE%/*}/.." && pwd)

# shellcheck disable=SC1091
type "find_files" &>/dev/null || . "$DOTFILES/functions/find_files"

_brewd="${HOMEBREW_PREFIX:-/usr/local}"

################################################################################
# 'nix
################################################################################

# coreutils support:
_cutilsd="$_brewd/opt/coreutils"
[[ -d "$_cutilsd/libexec/gnubin" ]] && PATH="$_cutilsd/libexec/gnubin:$PATH"

# openssl support:
_ossl1d="$_brewd/opt/openssl@1.1"
_ossl3d="$_brewd/opt/openssl@3"
if [[ -d "$_ossl3d/bin" ]]; then
  # If you need to have openssl@3 first in your PATH run:
  PATH="$_ossl3d/bin:$PATH"
  # For compilers to find openssl@3 you may need to set:
  [[ -d "$_ossl3d/lib" ]] && LDFLAGS="-L$_ossl3d/lib"
  [[ -d "$_ossl3d/include" ]] && CPPFLAGS="-I$_ossl3d/include"
  # For pkg-config to find openssl@3 you may need to set:
  [[ -d "$_ossl3d/lib/pkgconfig" ]] && PKG_CONFIG_PATH="$_ossl3d/lib/pkgconfig"
elif [[ -d "$_ossl1d/bin" ]]; then
  # If you need to have openssl@1.1 first in your PATH run:
  PATH="$_ossl1d/bin:$PATH"
  # For compilers to find openssl@1.1 you may need to set:
  [[ -d "$_ossl1d/lib" ]] && LDFLAGS="-L$_ossl1d/lib"
  [[ -d "$_ossl1d/include" ]] && CPPFLAGS="-I$_ossl1d/include"
  # For pkg-config to find openssl@1.1 you may need to set:
  [[ -d "$_ossl1d/lib/pkgconfig" ]] && PKG_CONFIG_PATH="$_ossl1d/lib/pkgconfig"
fi

#-------------------------------------------------------------------------------
# Elixir / Erlang
#-------------------------------------------------------------------------------

_erlangd="$_brewd/opt/erlang"
[[ -d "$_erlangd" ]] && MANPATH="$_erlangd/lib/erlang/man:$MANPATH"

#-------------------------------------------------------------------------------
# Git
#-------------------------------------------------------------------------------

_gitd="$_brewd/opt/git"
[[ -d "$_gitd/man" ]] && MANPATH="$_gitd/man:$MANPATH"

#-------------------------------------------------------------------------------
# Go
#-------------------------------------------------------------------------------

_golangd="$_brewd/opt/golang"
_gohomed="$HOME/go"
if type "go" &>/dev/null; then
  mkdir -p "$_gohomed"/{bin,src,pkg}
  GOPATH="$_gohomed"
  [[ -d "$_golangd/libexec" ]] && GOROOT="$_golangd/libexec"
  [[ -d "${GOPATH:-$_gohomed}/bin" ]] && PATH="$PATH:${GOPATH:-$_gohomed}/bin"
  [[ -d "${GOROOT:-$_gohomed}/bin" ]] && PATH="$PATH:${GOROOT:-$_gohomed}/bin"
  export GOPATH GOROOT
fi

#-------------------------------------------------------------------------------
# Java
#-------------------------------------------------------------------------------

_javad="$_brewd/opt/openjdk"
_jvmd="/Library/Java/JavaVirtualMachines"
if [[ -d "$_javad/bin" ]]; then
  # For system Java wrappers to find this JDK, symlink it (sudo/admin required):
  # if [[ -d "$_jvmd" ]] && [[ ! -e "$_jvmd/openjdk.jdk" ]] &&
  #   [[ -e "$_javad/libexec/openjdk.jdk" ]]; then
  #   sudo ln -sfn "$_javad/libexec/openjdk.jdk" "$_jvmd/openjdk.jdk"
  # fi
  # openjdk is keg-only, which means it was not symlinked into $(brew --prefix),
  # because macOS provides similar software and installing this software in
  # parallel can cause all kinds of trouble.
  # To have openjdk first in your PATH:
  [[ -d "$_javad/bin" ]] && PATH="$_javad/bin:$PATH"
  # For compilers to find openjdk you may need to set:
  [[ -e "$_javad/include" ]] && CPPFLAGS="-I$_javad/include"
fi

#-------------------------------------------------------------------------------
# MySQL
#-------------------------------------------------------------------------------

# MySQL-manual:
_mysqld="$_brewd/opt/mysql"
[[ -d "$_mysqld/man" ]] && MANPATH="$_mysqld/man:$MANPATH"

#-------------------------------------------------------------------------------
# Node.js
#-------------------------------------------------------------------------------

# .node bin:
_nodebind="$HOME/.node/bin"
[[ -d "$_nodebind" ]] && PATH="$_nodebind:$PATH"
# .node node_modules:
_nodemodsd="$HOME/.node/lib/node_modules"
[[ -d "$_nodemodsd" ]] && export NODE_PATH="$_nodemodsd:$NODE_PATH"
# If Homebrew has NOT installed npm, you should supplement
# your NODE_PATH with the npm module folder:
_nodemodsd="${HOMEBREW_PREFIX:-/usr}/lib/node_modules"
[[ -d "$_nodemodsd" ]] && export NODE_PATH="$_nodemodsd:$NODE_PATH"

#-------------------------------------------------------------------------------
# Ruby
#-------------------------------------------------------------------------------

_rubyd="$_brewd/opt/ruby"
if [[ -d "$_rubyd/bin" ]]; then
  # If you need to have ruby first in your PATH run:
  PATH="$_rubyd/bin:$PATH"
  # For compilers to find ruby you may need to set:
  [[ -d "$_rubyd/lib" ]] && LDFLAGS="-L$_rubyd/lib"
  [[ -d "$_rubyd/include" ]] && CPPFLAGS="-I$_rubyd/include"
  # For pkg-config to find ruby you may need to set:
  [[ -d "$_rubyd/lib/pkgconfig" ]] && PKG_CONFIG_PATH="$_rubyd/lib/pkgconfig"
  # By default, binaries installed by gem will be placed into:
  for _file in $(find_files "${HOMEBREW_PREFIX:-}/lib/ruby/gems" 'bin' 2 'd'); do
    PATH="$_file:$PATH"
  done
fi

for _file in $(find_files "$HOME/.gem/ruby" 'bin' 2 'd'); do
  PATH="$_file:$PATH"
done

# rbenv + ruby-build:
_rbenvd="$HOME/.rbenv"
if [[ -d "$_rbenvd" ]]; then
  PATH="$_rbenvd/shims:$PATH"
  PATH="$_rbenvd/bin:$PATH"
  PATH="$_rbenvd/plugins/ruby-build/bin:$PATH"
fi

#-------------------------------------------------------------------------------
# PHP / Composer
#-------------------------------------------------------------------------------

[[ -d "$HOME/.composer/vendor/bin" ]] && PATH="$HOME/.composer/vendor/bin:$PATH"

#-------------------------------------------------------------------------------
# Terraform
#-------------------------------------------------------------------------------

[[ -d "$HOME/terraform" ]] && PATH="$HOME/terraform:$PATH"
_terrad="$_brewd/opt/terraform"
[[ -d "$_terrad/bin" ]] && PATH="$_terrad/bin:$PATH"

#-------------------------------------------------------------------------------
# Yarn
#-------------------------------------------------------------------------------

type "yarn" &>/dev/null && PATH="$(yarn global bin):$PATH"

#-------------------------------------------------------------------------------
# exports
#-------------------------------------------------------------------------------

export LDFLAGS CPPFLAGS PKG_CONFIG_PATH
export PATH MANPATH INFOPATH
