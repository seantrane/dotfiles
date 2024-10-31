# shellcheck shell=bash disable=SC1090,SC1091
#
# EXPORTS
# Defines exports/variables for bash scripting environment.

#-------------------------------------------------------------------------------
# DEFAULT VARIABLES
#-------------------------------------------------------------------------------

# your project folder that we can `c [tab]` to
export PROJECTS="$HOME/Projects"

# BROWSER
if [[ "$OSTYPE" == "darwin"* ]]; then
  export BROWSER="open"
fi

# EDITORS
# Use VIM, by default
EDITOR="vim"
VISUAL="$EDITOR"
if type "code" &>/dev/null; then
  # Use VS Code, if available
  EDITOR="code"
  VISUAL="$EDITOR"
elif type "nvim" &>/dev/null; then
  # Use Neovim, if available
  EDITOR="nvim"
  VISUAL="$EDITOR"
  alias vi="nvim"
elif ! type "vim" &>/dev/null && type "nano" &>/dev/null; then
  # Use Nano, as a fallback
  EDITOR="nano"
  VISUAL="$EDITOR"
elif ! type "vim" &>/dev/null && type "pico" &>/dev/null; then
  # Use Pico, as a fallback
  EDITOR="pico"
  VISUAL="$EDITOR"
fi
export EDITOR VISUAL

# LESS > MORE
export PAGER="less"
export NULLCMD="cat"
export READNULLCMD="$PAGER"

# LANGUAGE
[[ -z "$LANG" ]] && export LANG="en_US.UTF-8"

#-------------------------------------------------------------------------------
# CUSTOM/USER VARIABLES
#-------------------------------------------------------------------------------
# `~/.exports` can be used for private variables.

[[ -f "$HOME/.exports" ]] && . "$HOME/.exports"
