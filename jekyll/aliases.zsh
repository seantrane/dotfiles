#!/usr/bin/env bash
#
# Aliases for Jekyll (and Bundler)

alias binstall="bundle install"
alias bjbuild="bundle exec jekyll build --incremental"
alias bjserve="bundle exec jekyll serve --incremental --watch"
alias bjbs="bjbuild; bjserve"
