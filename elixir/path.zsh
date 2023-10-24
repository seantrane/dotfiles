#!/usr/bin/env bash

if type "elixir" &> /dev/null; then
    export MANPATH="$(brew --prefix erlang)/lib/erlang/man:$MANPATH"
fi
