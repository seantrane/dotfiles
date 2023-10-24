#!/usr/bin/env bash
#
# Install Mac OS Apps
#
# This installs Mac OS Apps with Casks using Homebrew + Caskroom.

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if type "brew" &> /dev/null; then

    # sh_info "Installing Caskroom/cask..."
    # brew tap homebrew/cask

    sh_info "Setting up Caskroom/versions tap..."
    brew tap homebrew/cask-versions

    sh_info "Installing Apps..."
    brew install --cask 1password
    brew install --cask a-better-finder-rename
    # brew install --cask adobe-creative-cloud
    # brew install --cask adobe-photoshop-lightroom
    # brew install --cask adobe-reader
    brew install --cask alfred
    # brew install --cask atom
    # brew install --cask audacity
    # brew install --cask citrix-receiver
    # brew install --cask cleanmymac
    # brew install --cask cyberduck
    # brew install --cask dash
    # brew install --cask dash-beta
    # brew install --cask docker
    # brew install --cask drobo-dashboard
    # brew install --cask dropbox
    # brew install --cask evernote
    # brew install --cask firefox
    # brew install --cask gimp
    brew install --cask github
    # brew install --cask gitkraken
    # brew install --cask gitx
    # brew install --cask google-chrome
    brew install --cask handbrake
    brew install --cask imagealpha
    brew install --cask imageoptim
    # brew install --cask intellij-idea
    # brew install --cask intellij-idea-ce
    brew install --cask iterm2
    # brew install --cask java
    # brew install --cask jenkins
    # brew install --cask jenkins-lts
    # brew install --cask jenkins-menu
    # brew install --cask kaleidoscope-beta
    # brew install --cask keka
    # brew install --cask libreoffice
    # brew install --cask little-snitch
    brew install --cask macpar-deluxe
    # brew install --cask mamp
    # brew install --cask microsoft-lync
    # brew install --cask microsoft-office
    brew install --cask mongodb-compass
    # brew install --cask phpstorm
    brew install --cask postman
    # brew install --cask screenflow
    # brew install --cask sequel-pro
    # brew install --cask skype
    brew install --cask slack
    brew install --cask sourcetree
    # brew install --cask spectacle
    # brew install --cask stellarium
    # brew install --cask sublime-text
    # brew install --cask svnx
    # brew install --cask textexpander
    brew install --cask the-unarchiver
    # brew install --cask tower
    # brew install --cask transmission
    # brew install --cask vagrant
    brew install --cask virtualbox
    brew install --cask visual-studio-code
    # brew install --cask vitalsource-bookshelf
    brew install --cask vlc
    # brew install --cask webstorm
    # brew install --cask whatsapp
    brew install --cask xld
    # brew install --cask xquartz
    # brew install --cask xtrafinder
    brew install --cask zoom

    sh_info "Setting up Caskroom/fonts tap..."
    brew tap homebrew/cask-fonts

    sh_info "Installing Fonts..."
    brew install --cask font-arimo
    brew install --cask font-dejavu-sans
    brew install --cask font-fontawesome
    brew install --cask font-inconsolata
    brew install --cask font-open-iconic
    brew install --cask font-open-sans
    brew install --cask font-open-sans-condensed
    brew install --cask font-source-code-pro
    brew install --cask font-source-sans-pro
    brew install --cask font-source-serif-pro
    brew install --cask font-ubuntu

    brew cleanup

fi
