#!/usr/bin/env bash
#
# EXPORTS
#
# Defines exports/variables for bash scripting environment.
#
# shellcheck disable=SC1090,SC1091

#-----------------------------------------------------------------------
# DEFAULT VARIABLES
#-----------------------------------------------------------------------

# your project folder that we can `c [tab]` to
export PROJECTS="$HOME/Projects"

# BROWSER
if [[ "$OSTYPE" == "darwin"* ]]; then
  export BROWSER="open"
fi

# EDITORS
# Use VIM, by default
export EDITOR="vim"
export VISUAL="vim"
if type "code" &> /dev/null; then
  # Use VS Code, if available
  export EDITOR="code"
  export VISUAL="code"
elif type "nvim" &> /dev/null; then
  # Use Neovim, if available
  export EDITOR="nvim"
  export VISUAL="nvim"
  alias vi="nvim"
elif ! type "vim" &> /dev/null && type "nano" &> /dev/null; then
  # Use Nano, as a fallback
  export EDITOR="nano"
  export VISUAL="nano"
elif ! type "vim" &> /dev/null && type "pico" &> /dev/null; then
  # Use Pico, as a fallback
  export EDITOR="pico"
  export VISUAL="pico"
fi

export PAGER="less"

# LANGUAGE
[[ -z "$LANG" ]] && export LANG="en_US.UTF-8"

#-----------------------------------------------------------------------
# CUSTOM/USER VARIABLES
#-----------------------------------------------------------------------
# `~/.exports` can be used for private variables.

[[ -f "$HOME/.exports" ]] && . "$HOME/.exports"
