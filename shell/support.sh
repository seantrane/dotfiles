#!/usr/bin/env bash
#
# Shell script support
# This file contains functions and helpers for Shell scripts.

#-----------------------------------------------------------------------
# Shell Environment
#-----------------------------------------------------------------------

# . ~/.env
# shellcheck disable=SC1090
[[ -f "$HOME/.env" ]] && source "$HOME/.env"


# Shortcut to this file is $SHELLSUPPORT
# This variable is used for support-file-conditionals
export SHELLSUPPORT=$DOTSHELL/support.sh

