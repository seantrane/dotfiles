# shellcheck shell=bash
#
# Git aliases

if [[ "$SHELL" == *"/zsh" ]]; then
  # alias g="git"
  # alias gl="git pull --prune"
  # alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
  # alias gp="git push origin HEAD"
  # alias gd="git diff"
  # alias gc="git commit"
  # alias gca="git commit -a"
  # alias gco="git checkout"
  # alias gcb="git copy-branch-name"
  # alias gb="git branch"
  # alias gs="git status -sb" # upgrade your git if -sb breaks for you. it's fun.
  alias gac="git add -A && git commit -m" # shortcut for adding and committing together
else
  alias g="git"
  alias gl="git pull --prune"
  alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
  alias gp="git push origin HEAD"
  alias gd="git diff"
  alias gc="git commit"
  alias gca="git commit -a"
  alias gco="git checkout"
  alias gcb="git copy-branch-name"
  alias gb="git branch"
  alias gs="git status -sb" # upgrade your git if -sb breaks for you. it's fun.
  alias gac="git add -A && git commit -m" # shortcut for adding and committing together
fi

# Use Git’s colored diff when available
hash "git" &>/dev/null
if [[ $? -eq 0 ]]; then
  function diff() {
    git diff --no-index --color-words "$@"
  }
fi
