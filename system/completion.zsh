# shellcheck shell=bash disable=SC1090
#
# System Command Tab Completions for Zsh

################################################################################
# Git
################################################################################

# Uses git's autocompletion for inner commands. Assumes an install of git's
# bash `git-completion` script at $completion below (this is where Homebrew
# tosses it, at least).
[[ -f "$HOMEBREW_PREFIX/share/zsh/site-functions/_git" ]] && \
    . "$HOMEBREW_PREFIX/share/zsh/site-functions/_git"

################################################################################
# rbenv
################################################################################
# https://github.com/sstephenson/rbenv/blob/master/completions/rbenv.zsh

# [[ ! -o interactive ]] && return

# _rbenv() {
#   local words completions
#   read -r -cA words

#   if [[ "${#words}" -eq 2 ]]; then
#     completions="$(rbenv commands)"
#   else
#     completions="$(rbenv completions ${words[2,-2]})"
#   fi

#   reply=("${(ps:\n:)completions}")
# }

# type "rbenv" &> /dev/null && compctl -K _rbenv rbenv

################################################################################
# Serverless
################################################################################

_slsd="$HOMEBREW_PREFIX/lib/node_modules/serverless"
_slscompd="$_slsd/node_modules/tabtab/.completions"
# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f "$_slscompd/serverless.zsh" ]] && . "$_slscompd/serverless.zsh"
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f "$_slscompd/sls.zsh" ]] && . "$_slscompd/sls.zsh"
