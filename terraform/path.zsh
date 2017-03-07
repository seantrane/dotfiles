#!/usr/bin/env bash

if [ -d "$HOME/terraform" ]; then
    export PATH="$HOME/terraform:$PATH"
fi

if [ -d "/usr/local/terraform/bin" ]; then
    export PATH="/usr/local/terraform/bin:$PATH"
fi

