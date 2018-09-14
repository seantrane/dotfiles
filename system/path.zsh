#!/usr/bin/env bash

# # .local bin:
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"

#
# Help docs/manuals:
# 

[[ -d "/usr/local/man" ]] && export MANPATH="/usr/local/man:$MANPATH"

# .local manuals:
[[ -d "$HOME/.local/man" ]] && export PATH="$HOME/.local/man:$MANPATH"
