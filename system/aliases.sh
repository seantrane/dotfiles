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

# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='(cd; sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm cache clean -g -f; npm install -g npm@latest; npm update -g; npm cache clean -g -f; sudo gem update --system; sudo gem update)'
alias brewupdate='brew update; brew upgrade; brew cleanup'
alias macupdate='sudo softwareupdate -i -a'
alias nodeupdate='(cd; npm cache clean -g -f; brew update node --without-npm; npm install -g npm@latest; npm update -g; npm cache clean -g -f)'
alias rubyupdate='sudo gem update --system; sudo gem update'
