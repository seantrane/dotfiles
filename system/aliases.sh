# shellcheck shell=bash
#
# System Aliases

# Shortcuts
# alias d="cd ~/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
# alias p="cd ~/projects"
alias h="history"
alias j="jobs"

#-------------------------------------------------------------------------------
# Update aliases
#-------------------------------------------------------------------------------

alias brewupdate='brew update; brew upgrade; brew cleanup;'
alias nodeupdate='(cd; npm cache clean -g -f; brew upgrade node; npm install -g npm@latest; npm update -g; npm cache clean -g -f)'
alias npmupdate="(cd; npm cache clean -g -f; npm install -g npm@latest; npm update -g; npm cache clean -g -f)"
alias rubyupdate='sudo gem update --system; sudo gem update;'

#-------------------------------------------------------------------------------
# Node/npm aliases
#-------------------------------------------------------------------------------

alias npmlistg="npm list -g --depth=0 </dev/null 2>/dev/null;"
alias npmlist="npm list --depth=0 </dev/null 2>/dev/null;"

#-------------------------------------------------------------------------------
# Docker aliases
#-------------------------------------------------------------------------------

alias compose="docker compose"
alias composestop="docker compose stop </dev/null 2>/dev/null;"
alias composeup="docker compose stop </dev/null 2>/dev/null; docker compose up --build"
# shellcheck disable=SC2139
alias composedown="docker compose stop </dev/null 2>/dev/null; docker compose down --remove-orphans </dev/null 2>/dev/null; docker rmi -f \"$(docker images -f "dangling=true" -q </dev/null 2>/dev/null)\" </dev/null 2>/dev/null; docker ps;"
# shellcheck disable=SC2139
alias composeoff="docker ps; docker compose stop </dev/null 2>/dev/null; docker rm -f \"$(docker ps -a -q </dev/null 2>/dev/null)\" </dev/null 2>/dev/null; docker ps -a;"

# shellcheck disable=SC2139
alias dkill="docker ps -a; docker compose stop </dev/null 2>/dev/null; docker kill \"$(docker ps -q </dev/null 2>/dev/null)\" </dev/null 2>/dev/null; docker ps -a;"
# shellcheck disable=SC2139
alias drmall="docker ps -a; docker compose stop </dev/null 2>/dev/null; docker kill \"$(docker ps -q </dev/null 2>/dev/null)\" </dev/null 2>/dev/null; docker rm --force \"$(docker ps -q </dev/null 2>/dev/null)\" </dev/null 2>/dev/null; docker ps -a;"
# shellcheck disable=SC2139
alias dreset="docker ps -a; docker compose stop </dev/null 2>/dev/null; docker kill \"$(docker ps -q </dev/null 2>/dev/null)\" </dev/null 2>/dev/null; docker rm --force \"$(docker ps -a -q </dev/null 2>/dev/null)\" </dev/null 2>/dev/null; docker ps -a; docker images; docker rmi --force \"$(docker images -a -q </dev/null 2>/dev/null)\" </dev/null 2>/dev/null; docker images;"

#-------------------------------------------------------------------------------
# Jekyll (and Bundler) aliases
#-------------------------------------------------------------------------------

alias binstall="bundle install"
alias bjbuild="bundle exec jekyll build --incremental"
alias bjserve="bundle exec jekyll serve --incremental --watch"
alias bjbs="bjbuild; bjserve"

#-------------------------------------------------------------------------------
# PHP/Composer/Laravel aliases
#-------------------------------------------------------------------------------

# Artisan CLI
alias art="php artisan"

#-------------------------------------------------------------------------------
# Ruby aliases
#-------------------------------------------------------------------------------

alias sc="script/console"
alias sg="script/generate"
alias sd="script/destroy"
