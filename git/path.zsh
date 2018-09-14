#!/usr/bin/env bash

# Git-manual:
if type "brew" &> /dev/null && [ -d "$(brew --prefix)/git/man" ]; then
    export MANPATH="$(brew --prefix)/git/man:$MANPATH"
fi
