#!/usr/bin/env bash

[[ -z "$BREW_PREFIX" ]] && BREW_PREFIX="$(brew --prefix)"

###############################################################################
# Git
###############################################################################

# Uses git's autocompletion for inner commands. Assumes an install of git's
# bash `git-completion` script at $completion below (this is where Homebrew
# tosses it, at least).
[[ -f "$BREW_PREFIX/share/zsh/site-functions/_git" ]] && \
    . "$BREW_PREFIX/share/zsh/site-functions/_git"

###############################################################################
# rbenv
###############################################################################
# https://github.com/sstephenson/rbenv/blob/master/completions/rbenv.zsh

# [[ ! -o interactive ]] && return

# _rbenv() {
#   local words completions
#   read -r -cA words

#   if [[ "${#words}" -eq 2 ]]; then
#     completions="$(rbenv commands)"
#   else
#     completions="$(rbenv completions ${words[2,-2]})"
#   fi

#   reply=("${(ps:\n:)completions}")
# }

# type "rbenv" &> /dev/null && compctl -K _rbenv rbenv

###############################################################################
# Serverless
###############################################################################

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
# shellcheck disable=SC1090
[[ -f "$BREW_PREFIX/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh" ]] && \
    . "$BREW_PREFIX/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh"
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
# shellcheck disable=SC1090
[[ -f "$BREW_PREFIX/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh" ]] && \
    . "$BREW_PREFIX/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh"
