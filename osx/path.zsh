#!/usr/bin/env bash

# coreutils support:
if type "brew" &> /dev/null && [ "$(brew ls --versions coreutils)" ]; then
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
fi
# MAMP support:
if [ -d "/Applications/MAMP/Library/bin" ]; then
    export PATH="/Applications/MAMP/Library/bin:$PATH"
fi
