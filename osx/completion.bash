#!/usr/bin/env bash
#
# OS X tab completion for Bash

# OS-CONDITIONALS
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Add tab completion for `defaults read|write NSGlobalDomain`
    # You could just use `-g` instead, but I like being explicit
    complete -W "NSGlobalDomain" defaults;
    # Add `killall` tab completion for common apps
    complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;
fi
