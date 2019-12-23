#!/usr/bin/env bash
#
# https://github.com/sstephenson/rbenv/blob/master/completions/rbenv.zsh

if [[ ! -o interactive ]]; then
    return
fi

if type "rbenv" &> /dev/null; then
    compctl -K _rbenv rbenv
fi

_rbenv() {
    local words completions
    read -r -cA words

    if [[ "${#words}" -eq 2 ]]; then
        completions="$(rbenv commands)"
    else
        completions="$(rbenv completions ${words[2,-2]})"
    fi

    reply=("${(ps:\n:)completions}")
}
