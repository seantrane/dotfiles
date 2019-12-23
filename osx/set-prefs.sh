#!/usr/bin/env bash
#
# Sets OS X Application preferences.


###############################################################################
# iTerm 2                                                                     #
###############################################################################

# Install the Monokai Soda theme for iTerm
open "$HOME"/.dotfiles/osx/init/Monokai\ Soda.itermcolors

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false


###############################################################################
# Google Chrome & Google Chrome Canary                                        #
###############################################################################

# Allow installing user scripts via GitHub Gist or Userscripts.org
defaults write com.google.Chrome ExtensionInstallSources -array "https://gist.githubusercontent.com/" "http://userscripts.org/*"
defaults write com.google.Chrome.canary ExtensionInstallSources -array "https://gist.githubusercontent.com/" "http://userscripts.org/*"

# Disable the all too sensitive backswipe
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

# Use the system-native print preview dialog
defaults write com.google.Chrome DisablePrintPreview -bool true
defaults write com.google.Chrome.canary DisablePrintPreview -bool true


###############################################################################
# SizeUp.app                                                                  #
###############################################################################

# Start SizeUp at login
# defaults write com.irradiatedsoftware.SizeUp StartAtLogin -bool true

# Don’t show the preferences window on next start
# defaults write com.irradiatedsoftware.SizeUp ShowPrefsOnNextStart -bool false


###############################################################################
# Google Update Stopper                                                       #
###############################################################################

GOOGLE_UPDATER_FILE="Library/Google/GoogleSoftwareUpdate/GoogleSoftwareUpdate.bundle/Contents/Resources/GoogleSoftwareUpdateAgent.app/Contents/Resources/install.py"

# Remove global update-agent
if [ -f "$GOOGLE_UPDATER_FILE" ];
then
    sudo "/$GOOGLE_UPDATER_FILE" --uninstall
fi

# Remove local update-agent
if [ -f "$GOOGLE_UPDATER_FILE" ];
then
    sudo "$HOME/$GOOGLE_UPDATER_FILE" --uninstall
fi

# Void the update-checker
defaults write com.google.Keystone.Agent checkInterval 0


###############################################################################
# Sublime Text                                                                #
###############################################################################

SUBLIME_DOT_PREFS="$HOME/.dotfiles/osx/init/Sublime"
SUBLIME_PREF_PATH="$HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/"

if [ -d "$SUBLIME_PREF_PATH" ];
then
    # Install Sublime Text settings
    cp "$SUBLIME_DOT_PREFS/Preferences.sublime-settings" "$SUBLIME_PREF_PATH"

    # Install Sublime Text key bindings
    cp "$SUBLIME_DOT_PREFS"/Default\ '(OSX)'.sublime-keymap "$SUBLIME_PREF_PATH"

    # Install Sublime Text lessc build
    cp "$SUBLIME_DOT_PREFS/less.sublime-build" "$SUBLIME_PREF_PATH"

    # Install Sublime Text themes
    cp -a "$SUBLIME_DOT_PREFS/Themes" "$SUBLIME_PREF_PATH"

    # Install Sublime Text snippets
    cp -a "$SUBLIME_DOT_PREFS/Snippets" "$SUBLIME_PREF_PATH"
fi

###############################################################################
# Twitter.app                                                                 #
###############################################################################

# Disable smart quotes as it’s annoying for code tweets
defaults write com.twitter.twitter-mac AutomaticQuoteSubstitutionEnabled -bool false

# Show the app window when clicking the menu icon
defaults write com.twitter.twitter-mac MenuItemBehavior -int 1

# Enable the hidden ‘Develop’ menu
defaults write com.twitter.twitter-mac ShowDevelopMenu -bool true

# Open links in the background
defaults write com.twitter.twitter-mac openLinksInBackground -bool true

# Allow closing the ‘new tweet’ window by pressing `Esc`
defaults write com.twitter.twitter-mac ESCClosesComposeWindow -bool true

# Show full names rather than Twitter handles
defaults write com.twitter.twitter-mac ShowFullNames -bool true

# Hide the app in the background if it’s not the front-most window
defaults write com.twitter.twitter-mac HideInBackground -bool true


###############################################################################
# Kill affected applications                                                  #
###############################################################################

# for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
#     "Dock" "Finder" "Google Chrome" "Google Chrome Canary" "Mail" "Messages" \
#     "Opera" "Safari" "SizeUp" "Spectacle" "SystemUIServer" "Terminal" \
#     "Transmission" "Twitter" "iCal"; do
#     killall "${app}" > /dev/null 2>&1
# done
# echo "Done. Note that some of these changes require a logout/restart to take effect."
