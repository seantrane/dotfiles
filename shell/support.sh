# shellcheck shell=bash
#
# Shell script support
# This file contains functions and helpers for Shell scripts.
#
# shellcheck disable=SC1090,SC1091

#-------------------------------------------------------------------------------
# Shell Environment
#-------------------------------------------------------------------------------

# . ~/.env
[[ -f "$HOME/.env" ]] && . "$HOME/.env"


# Shortcut to this file is $SHELLSUPPORT
# This variable is used for support-file-conditionals
export SHELLSUPPORT="$DOTSHELL/support.sh"
