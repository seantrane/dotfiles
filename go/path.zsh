#!/usr/bin/env bash

[[ -d "$HOME/go" ]] && export GOPATH="$HOME/go"
[[ -d "$(brew --prefix golang)/libexec" ]] && export GOROOT="$(brew --prefix golang)/libexec"
[[ -d "${GOPATH}/bin" ]] && export PATH="$PATH:${GOPATH}/bin"
[[ -d "${GOROOT}/bin" ]] && export PATH="$PATH:${GOROOT}/bin"
