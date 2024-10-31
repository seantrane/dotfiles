# shellcheck shell=bash

#-------------------------------------------------------------------------------
# Homebrew aliases
#-------------------------------------------------------------------------------

# Homebrew updates/upgrades
alias brew_update="brew update; brew upgrade; brew cleanup"

#-------------------------------------------------------------------------------
# Docker aliases
#-------------------------------------------------------------------------------

alias dockerc="docker compose"
alias dkrup="docker compose stop < /dev/null 2> /dev/null; docker compose up --build"
alias dkrstop="docker compose stop < /dev/null 2> /dev/null"
# shellcheck disable=SC2139
alias dkroff="docker ps; docker compose stop < /dev/null 2> /dev/null; docker rm -f \"$(docker ps -a -q </dev/null 2>/dev/null)\" < /dev/null 2> /dev/null; docker ps -a"
# shellcheck disable=SC2139
alias dkr0="docker images; docker compose stop < /dev/null 2> /dev/null; docker rmi -f \"$(docker images -a -q </dev/null 2>/dev/null)\" < /dev/null 2> /dev/null; docker images"

#-------------------------------------------------------------------------------
# Jekyll (and Bundler) aliases
#-------------------------------------------------------------------------------

alias binstall="bundle install"
alias bjbuild="bundle exec jekyll build --incremental"
alias bjserve="bundle exec jekyll serve --incremental --watch"
alias bjbs="bjbuild; bjserve"

#-------------------------------------------------------------------------------
# Laravel aliases
#-------------------------------------------------------------------------------

# Artisan CLI
alias art="php artisan"

#-------------------------------------------------------------------------------
# Node.js/npm aliases
#-------------------------------------------------------------------------------

alias node-update="brew upgrade node"
alias npm-update="(cd; npm cache clean -g -f; node-update; npm install -g npm@latest; npm update -g; npm cache clean -g -f)"

alias npmlistg="npm list -g --depth=0 2>/dev/null"
alias npmlist="npm list --depth=0 2>/dev/null"

#-------------------------------------------------------------------------------
# Ruby aliases
#-------------------------------------------------------------------------------

alias sc="script/console"
alias sg="script/generate"
alias sd="script/destroy"
