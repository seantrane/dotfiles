#!/usr/bin/env bash
#
# https://github.com/sstephenson/rbenv/blob/master/completions/rbenv.bash

_rbenv() {
    COMPREPLY=()
    local word="${COMP_WORDS[COMP_CWORD]}"

    if [ "$COMP_CWORD" -eq 1 ]; then
        COMPREPLY=( $(compgen -W "$(rbenv commands)" -- "$word") )
    else
        local words=("${COMP_WORDS[@]}")
        unset words[0]
        unset words[$COMP_CWORD]
        local completions=$(rbenv completions "${words[@]}")
        COMPREPLY=( $(compgen -W "$completions" -- "$word") )
    fi
}

if type "rbenv" &> /dev/null; then
    complete -F _rbenv rbenv
fi
