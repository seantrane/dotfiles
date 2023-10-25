#!/usr/bin/env bash

###############################################################################
# boom
###############################################################################
# http://zachholman.com/boom

# if type "boom" &> /dev/null; then
#   _arguments -C '1: :->cmds' '*: :->args'
#   case ${state:-} in
#     cmds)
#       local -a cmds
#       cmds=(
#         "all:show all items in all lists"
#         "edit:edit the boom JSON file in $EDITOR"
#         "help:help text"
#       )
#       _describe -t commands 'boom command' cmds
#       _values 'lists' "$(boom | awk '{print $1}')"
#       ;;
#     args)
#       case ${line[1]} in
#         (boom|all|edit|help)
#           ;;
#         *)
#           _values 'items' "$(boom "${line[1]}" | awk '{print $1}' | sed -e 's/://')" 2>/dev/null
#           ;;
#       esac
#       ;;
#   esac
#   return
# fi

###############################################################################
# Git
###############################################################################

# Uses git's autocompletion for inner commands. Assumes an install of git's
# bash `git-completion` script at $completion below (this is where Homebrew
# tosses it, at least).
completion="$(brew --prefix)/share/zsh/site-functions/_git"

if test -f "$completion"; then
  . "$completion"
fi

###############################################################################
# rbenv
###############################################################################
# https://github.com/sstephenson/rbenv/blob/master/completions/rbenv.zsh

# [[ ! -o interactive ]] && return

# type "rbenv" &> /dev/null && compctl -K _rbenv rbenv

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

###############################################################################
# Serverless
###############################################################################

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
# shellcheck disable=SC1090
[[ -f "$(brew --prefix)/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh" ]] && \
  . "$(brew --prefix)/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh"
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
# shellcheck disable=SC1090
[[ -f "$(brew --prefix)/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh" ]] && \
  . "$(brew --prefix)/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh"
