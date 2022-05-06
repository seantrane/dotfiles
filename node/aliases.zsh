#!/usr/bin/env bash
#
# Node/NPM Aliases

alias node-update="brew update node"
alias npm-update="(cd; npm cache clean -g -f; node-update; npm install -g npm@latest; npm update -g; npm cache clean -g -f)"

alias npmlistg="npm list -g --depth=0 2>/dev/null"
alias npmlist="npm list --depth=0 2>/dev/null"
