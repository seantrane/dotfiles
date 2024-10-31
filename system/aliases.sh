# shellcheck shell=bash
#
# System Aliases
# shellcheck disable=SC2139

# Shortcuts
# alias d="cd ~/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
# alias p="cd ~/projects"
alias h="history"
alias j="jobs"

alias brewupdate='brew update; brew upgrade; brew cleanup'
alias nodeupdate='(cd; npm cache clean -g -f; brew upgrade node; npm install -g npm@latest; npm update -g; npm cache clean -g -f)'
alias rubyupdate='sudo gem update --system; sudo gem update'
