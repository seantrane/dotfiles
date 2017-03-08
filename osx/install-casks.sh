#!/usr/bin/env bash
#
# Install Mac OS Apps
#
# This installs Mac OS Apps with Casks using Homebrew + Caskroom.

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

if type "brew" &> /dev/null; then

    sh_info "Installing Caskroom/cask..."
    #brew install caskroom/cask/brew-cask
    brew tap caskroom/cask

    sh_info "Setting up Caskroom/versions tap..."
    brew tap caskroom/versions

    sh_info "Installing Apps..."
    brew cask install 1password
    brew cask install a-better-finder-rename
    # brew cask install adobe-air
    # brew cask install adobe-creative-cloud
    # brew cask install adobe-photoshop-lightroom
    # brew cask install adobe-reader
    brew cask install alfred
    brew cask install atom
    brew cask install audacity
    # brew cask install citrix-receiver
    # brew cask install cleanmymac
    # brew cask install cyberduck
    # brew cask install dash
    # brew cask install dash-beta
    brew cask install docker
    # brew cask install drobo-dashboard
    # brew cask install dropbox
    # brew cask install evernote
    brew cask install filezilla
    # brew cask install firefox
    # brew cask install flash
    brew cask install gimp
    # brew cask install github
    # brew cask install gitx
    brew cask install google-chrome
    brew cask install handbrake
    brew cask install imagealpha
    brew cask install imageoptim
    brew cask install intellij-idea-ce
    brew cask install iterm2
    brew cask install java
    # brew cask install jenkins
    # brew cask install jenkins-lts
    # brew cask install jenkins-menu
    # brew cask install kaleidoscope-beta
    brew cask install keka
    # brew cask install little-snitch
    # brew cask install mamp
    # brew cask install microsoft-lync
    # brew cask install microsoft-office
    # brew cask install openoffice
    # brew cask install phpstorm
    brew cask install robomongo
    # brew cask install screenflow
    brew cask install sequel-pro
    brew cask install slack
    brew cask install sourcetree
    brew cask install spectacle
    # brew cask install stellarium
    brew cask install sublime-text
    brew cask install svnx
    # brew cask install textexpander
    # brew cask install the-unarchiver
    # brew cask install tower
    brew cask install vagrant
    brew cask install virtualbox
    brew cask install visual-studio-code
    # brew cask install vitalsource-bookshelf
    brew cask install vlc
    brew cask install xld
    brew cask install xquartz
    # brew cask install xtrafinder

    # xquartz needs to be installed before wine
    brew install wine
    brew install winetricks
    brew cask install wineskin-winery

    sh_info "Setting up Caskroom/fonts tap..."
    brew tap caskroom/fonts

    sh_info "Installing Fonts..."
    brew cask install font-arimo
    brew cask install font-dejavu-sans
    brew cask install font-droid-sans
    brew cask install font-droid-sans-mono
    brew cask install font-droid-serif
    brew cask install font-fontawesome
    brew cask install font-inconsolata
    brew cask install font-open-iconic
    brew cask install font-open-sans
    brew cask install font-open-sans-condensed
    brew cask install font-source-code-pro
    brew cask install font-source-sans-pro
    brew cask install font-source-serif-pro
    brew cask install font-ubuntu

    brew cask cleanup

fi
