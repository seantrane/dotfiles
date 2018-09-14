#!/usr/bin/env bash
#
# Node/NPM Aliases

alias node-update='brew update node --without-npm'
alias npm-update='(cd;npm cache clean -g -f;node-update;npm install -g npm@latest;npm update -g;npm cache clean -g -f)'
