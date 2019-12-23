#!/usr/bin/env bash
#
# OS X Aliases

alias ios="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"

alias subl="open -a \"Sublime Text\""

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update="(cd; sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm cache clean -g -f; npm install -g npm@latest; npm update -g; npm cache clean -g -f; sudo gem update --system; sudo gem update)"
alias brewupdate="brew update; brew upgrade; brew cleanup"
alias macupdate="sudo softwareupdate -i -a"
alias nodeupdate="(cd; npm cache clean -g -f; brew update node --without-npm; npm install -g npm@latest; npm update -g; npm cache clean -g -f)"
alias rubyupdate="sudo gem update --system; sudo gem update"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# DNS
alias dns="scutil --dns"
alias dnsreload="sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.discoveryd.plist; sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.discoveryd.plist"

# Flush Directory Service cache
#alias flush="sudo dscacheutil -flushcache && killall -HUP mDNSResponder"
alias flush="sudo dscacheutil -flushcache;sudo discoveryutil mdnsflushcache;sudo discoveryutil udnsflushcaches;echo 'caches flushed'"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# JavaScriptCore REPL
#jscbin="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc";
#[ -e "${jscbin}" ] && alias jsc="${jscbin}";
#unset jscbin;

# Trim new lines and copy to clipboard
alias cc="tr -d '\n' | pbcopy"

# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sudo rm -rfv /Volumes/*/.Trashes"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
alias urlencode="python -c \"import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);\""

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf="/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py"

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

# PlistBuddy alias, because sometimes `defaults` just doesn’t cut it
alias plistbuddy="/usr/libexec/PlistBuddy"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
