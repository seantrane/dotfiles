#!/usr/bin/env bash

#if [[ -n $SSH_CONNECTION ]]; then
#  export PS1='%m:%3~$(git_info_for_prompt)%# '
#else
#  export PS1='%3~$(git_info_for_prompt)%# '
#fi

export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

fpath=($DOTFILES/functions $fpath)

autoload -U $DOTFILES/functions/*(:t)

# default history settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# don't nice background tasks
setopt NO_BG_NICE

setopt NO_HUP

setopt NO_LIST_BEEP

# allow functions to have local options
setopt LOCAL_OPTIONS

setopt LOCAL_TRAPS

# allow functions to have local traps
setopt HIST_VERIFY

# share history between sessions ???
setopt SHARE_HISTORY

# add timestamps to history
setopt EXTENDED_HISTORY

setopt PROMPT_SUBST

setopt CORRECT

setopt COMPLETE_IN_WORD

setopt IGNORE_EOF

# adds history
setopt APPEND_HISTORY

# adds history incrementally and share it across sessions
setopt INC_APPEND_HISTORY SHARE_HISTORY

# don't record dupes in history
setopt HIST_IGNORE_ALL_DUPS

setopt HIST_REDUCE_BLANKS

# auto 'cd dir' if you type 'dir'
setopt AUTO_CD

# Pipe to multiple outputs
setopt MULTIOS

# This makes cd=pushd
setopt AUTO_PUSHD

# This will use named dirs when possible
setopt AUTO_NAME_DIRS

# If we have a glob this will expand it
setopt GLOB_COMPLETE
setopt PUSHD_MINUS

# No more annoying pushd messages...
# setopt PUSHD_SILENT

# blank pushd goes to home
setopt PUSHD_TO_HOME

# this will ignore multiple directories for the stack.  Useful?  I dunno.
setopt PUSHD_IGNORE_DUPS

# 10 second wait if you do something that will delete everything.  I wish I'd had this before...
setopt RM_STAR_WAIT

# use magic (this is default, but it can't hurt!)
# ! DISABLED: can't change option: ZLE
#setopt ZLE

# If I could disable Ctrl-s completely I would!
setopt NO_FLOW_CONTROL

# Keep echo "station" > station from clobbering station
setopt NO_CLOBBER

# Case insensitive globbing
setopt NO_CASE_GLOB

# Be Reasonable!
setopt NUMERIC_GLOB_SORT

# I don't know why I never set this before.
setopt EXTENDED_GLOB

# hows about arrays be awesome?
# (that is, foo${cool}foo has foo surrounding all the variables, not just first and last
setopt RC_EXPAND_PARAM

# don't expand aliases _before_ completion has finished, like; git comm-[tab]
setopt complete_aliases

zle -N newtab

# Who doesn't want home and end to work?
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

# Incremental search is elite!
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward

# Search based on what you typed in already
bindkey -M vicmd "//" history-beginning-search-backward
bindkey -M vicmd "??" history-beginning-search-forward

bindkey "\eOP" run-help

# oh wow! This is killer... try it!
bindkey -M vicmd "q" push-line

# it's like, space AND completion. Gnarlbot.
bindkey -M viins ' ' magic-space

bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[^N' newtab
bindkey '^?' backward-delete-char
