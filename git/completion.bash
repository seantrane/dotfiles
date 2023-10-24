#!/usr/bin/env bash
#
# Enable tab completion for `g` by marking it as an alias for `git`

if type "_git" &> /dev/null && [[ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ]]; then
  complete -o default -o nospace -F _git g
fi
