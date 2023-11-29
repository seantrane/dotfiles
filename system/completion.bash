#!/usr/bin/env bash
#
# System Command Tab Completions for Bash

################################################################################
# 'nix
################################################################################
# Tab completion for SSH hostnames, based on ~/.ssh/config, ignoring wildcards

if [[ -e "$HOME/.ssh/config" ]]; then
  complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;
fi

################################################################################
# boom
################################################################################
# http://zachholman.com/boom

if type "boom" &> /dev/null; then
  _boom_complete() {
    local cur prev lists curr_list items
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    curr_list=$(eval echo "$prev")
    local IFS=$'\n'

    if [ "$COMP_CWORD" -eq 1 ]; then
      lists=$(boom | sed 's/^  \(.*\) ([0-9]\{1,\})$/\1/')
      # shellcheck disable=SC2207
      COMPREPLY=( $( compgen -W "${lists}" -- "${cur}" ) )
    elif [ "$COMP_CWORD" -eq 2 ]; then
      items=$(boom "$curr_list" | sed 's/^    \(.\{0,16\}\):.*$/\1/')
      # shellcheck disable=SC2207
      COMPREPLY=( $( compgen -W "${items}" -- "${cur}" ) )
    fi
  }
  complete -o filenames -F _boom_complete boom
fi

################################################################################
# Git
################################################################################
# Enable tab completion for `g` by marking it as an alias for `git`

if type "_git" &> /dev/null && [[ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ]]; then
  complete -o default -o nospace -F _git g
fi

################################################################################
# MacOS
################################################################################

if [[ "$OSTYPE" == "darwin"* ]]; then
  # Add tab completion for `defaults read|write NSGlobalDomain`
  # You could just use `-g` instead, but I like being explicit
  complete -W "NSGlobalDomain" defaults
  # Add `killall` tab completion for common apps
  complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall
fi

################################################################################
# rbenv
################################################################################
# https://github.com/sstephenson/rbenv/blob/master/completions/rbenv.bash

_rbenv() {
  COMPREPLY=()
  local word="${COMP_WORDS[COMP_CWORD]}"

  if [ "$COMP_CWORD" -eq 1 ]; then
    # shellcheck disable=SC2207
    COMPREPLY=( $(compgen -W "$(rbenv commands)" -- "$word") )
  else
    local words=("${COMP_WORDS[@]}")
    unset words["0"]
    unset words["$COMP_CWORD"]
    local completions
    completions=$(rbenv completions "${words[@]}")
    # shellcheck disable=SC2207
    COMPREPLY=( $(compgen -W "$completions" -- "$word") )
  fi
}

type "rbenv" &> /dev/null && complete -F _rbenv rbenv
