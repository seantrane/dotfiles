#!/usr/bin/env bash
#
# Add RVM to PATH for scripting

[[ -d "$HOME/.rvm/bin" ]] && export PATH="$HOME/.rvm/bin:$PATH"

# Load RVM into a shell session *as a function*
# http://stackoverflow.com/questions/13804382/how-to-automatically-run-bin-bash-login-automatically-in-the-embeded-termin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
