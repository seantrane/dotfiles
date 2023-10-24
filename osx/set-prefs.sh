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
# defaults write com.google.Chrome ExtensionInstallSources -array "https://gist.githubusercontent.com/" "http://userscripts.org/*"
# defaults write com.google.Chrome.canary ExtensionInstallSources -array "https://gist.githubusercontent.com/" "http://userscripts.org/*"

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
# Kill affected applications                                                  #
###############################################################################

# for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
#     "Dock" "Finder" "Google Chrome" "Google Chrome Canary" "Mail" "Messages" \
#     "Opera" "Safari" "SizeUp" "Spectacle" "SystemUIServer" "Terminal" \
#     "Transmission" "Twitter" "iCal"; do
#     killall "${app}" > /dev/null 2>&1
# done
# echo "Done. Note that some of these changes require a logout/restart to take effect."
