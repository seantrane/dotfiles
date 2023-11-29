#!/usr/bin/env bash
#
# Fix to discoveryd to force .local resolution through multicast.
# Executes the equivalent of `sudo discoveryutil mdnsactivedirectory yes` on boot.

# Fix to discoveryd to force .local resolution through multicast.
sudo discoveryutil mdnsactivedirectory yes

# Copy LaunchDaemon
sudo cp -fv "$HOME/.dotfiles/macos/init/Library/LaunchDaemons/com.discoveryd.fix.plist" "/Library/LaunchDaemons/com.discoveryd.fix.plist"

# Set root permissions
sudo chown root "/Library/LaunchDaemons/com.discoveryd.fix.plist"

# Load LaunchDaemon (no need for restart)
sudo launchctl load "/Library/LaunchDaemons/com.discoveryd.fix.plist"
