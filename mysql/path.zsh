#!/usr/bin/env bash

# MySQL-manual:
if type "brew" &> /dev/null && [ -d "$(brew --prefix)/mysql/man" ]; then
    export MANPATH="$(brew --prefix)/mysql/man:$MANPATH"
fi
