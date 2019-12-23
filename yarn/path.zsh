#!/usr/bin/env bash

if type "yarn" &> /dev/null && [[ -d "$(yarn global bin)" ]]; then
    export PATH="$(yarn global bin):$PATH"
fi
