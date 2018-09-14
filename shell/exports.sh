#!/usr/bin/env bash
#
# EXPORTS
#
# Defines exports/variables for bash scripting environment.

#-----------------------------------------------------------------------
# DEFAULT VARIABLES
#-----------------------------------------------------------------------

# your project folder that we can `c [tab]` to
export PROJECTS=$HOME/Projects

# BROWSER
if [[ "$OSTYPE" == "darwin"* ]]; then
    export BROWSER='open'
fi

# EDITORS
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Use Sublime (subl) on Mac
    export EDITOR='subl'
    export VISUAL='subl'
else
    export EDITOR='vi'
    export VISUAL='vi'
fi

export PAGER='less'

# LANGUAGE
[[ -z "$LANG" ]] && export LANG='en_US.UTF-8'


#-----------------------------------------------------------------------
# CUSTOM/USER VARIABLES
#-----------------------------------------------------------------------
# `~/.exports` can be used for private variables.

[[ -f "$HOME/.exports" ]] && source "$HOME/.exports"
