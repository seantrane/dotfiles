#!/usr/bin/env bash

# Add Linuxbrew PATHs (to your .bashrc or .zshrc):
if type "brew" &> /dev/null && [[ -d "$HOME/.linuxbrew" ]]; then
    export PATH="$HOME/.linuxbrew/bin:$PATH"
    export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
    export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
fi
