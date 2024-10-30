# shellcheck shell=bash
#
# FUNCTIONS
#
# Defines functions for bash scripting environment.
#
# shellcheck disable=SC1090,SC1091

#-------------------------------------------------------------------------------
# HELPER FUNCTIONS
#-------------------------------------------------------------------------------

! type "link_file" &>/dev/null && . "$DOTFILES/functions/link_file"
! type "lowercase" &>/dev/null && . "$DOTFILES/functions/lowercase"

#-------------------------------------------------------------------------------
# RVM
#-------------------------------------------------------------------------------
# Load RVM into a shell session *as a function*
# http://stackoverflow.com/questions/13804382/how-to-automatically-run-bin-bash-login-automatically-in-the-embeded-termin
# RVM users should consider switching to `rbenv` (http://gorails.com)

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

#-------------------------------------------------------------------------------
# CUSTOM/USER FUNCTIONS
#-------------------------------------------------------------------------------
# `~/.functions` can be used for private functions.

[[ -f "$HOME/.functions" ]] && . "$HOME/.functions"
