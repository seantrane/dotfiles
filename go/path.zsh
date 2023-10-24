#!/usr/bin/env bash

if type "go" &> /dev/null && [[ -d "$HOME/go" ]]; then
  if [[ ! -d "$HOME/go/bin" ]] || [[ ! -d "$HOME/go/src" ]] || [[ ! -d "$HOME/go/pkg" ]]; then
    mkdir -p "$HOME"/go/{bin,src,pkg}
    ls -al "$HOME/go"
  fi
fi

[[ -d "$HOME/go" ]] && export GOPATH="$HOME/go"
[[ -d "$(brew --prefix golang)/libexec" ]] && export GOROOT="$(brew --prefix golang)/libexec"
[[ -d "${GOPATH}/bin" ]] && export PATH="$PATH:${GOPATH}/bin"
[[ -d "${GOROOT}/bin" ]] && export PATH="$PATH:${GOROOT}/bin"
