#!/usr/bin/env bash

if type "elixir" &> /dev/null; then
    export MANPATH="/usr/local/opt/erlang/lib/erlang/man:$MANPATH"
fi
