#!/usr/bin/env bash

# Composer support:
if [ -d "$HOME/.composer/vendor/bin" ]; then
    export PATH="$HOME/.composer/vendor/bin:$PATH"
fi
