#!/usr/bin/env bash
#
# Initiate Ruby-environment (rbenv)

if (( $+commands[rbenv] )); then
    # Mac-only: Use Homebrew's directories instead of ~/.rbenv (add to your profile):
    if (( $+commands[brew] )) && [ "brew ls --versions rbenv" ]; then
        export RBENV_ROOT=/usr/local/var/rbenv
    fi

    # To enable shims and autocompletion add to your profile:
    # eval "$(rbenv init -)";
    # eval "$(rbenv init - zsh)";
    eval "$(rbenv init - --no-rehash)"
fi
