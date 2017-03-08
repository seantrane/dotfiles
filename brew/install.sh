#!/usr/bin/env bash
#
# Homebrew / Linuxbrew
#
# http://brew.sh
# https://github.com/Homebrew/homebrew
# https://github.com/Linuxbrew/linuxbrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew/Linuxbrew.

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

# Install Homebrew
if ! type "brew" &> /dev/null; then
    # test "$(expr substr $(uname -s) 1 5)" = "Linux"
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        # Install Linuxbrew dependencies...
        # https://github.com/Linuxbrew/linuxbrew#dependencies
        if type "apt-get" &> /dev/null; then
            # Debian or Ubuntu:
            sudo apt-get install build-essential curl git m4 python-setuptools ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev
        elif type "yum" &> /dev/null; then
            # Fedora, CentOS or Red Hat:
            sudo yum groupinstall 'Development Tools' && sudo yum install curl git irb m4 python-setuptools ruby texinfo bzip2-devel curl-devel expat-devel ncurses-devel zlib-devel
        fi
        sh_info "Installing Linuxbrew..."
        if type "ruby" &> /dev/null; then
            ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
        elif type "git" &> /dev/null; then
            git clone https://github.com/Homebrew/linuxbrew.git ~/.linuxbrew
        fi
    # test "$(uname)" = "Darwin"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Homebrew requires Xcode Command Line Tools
        source $DOTFILES/osx/install-clt.sh;
        if [[ ! "$XCODE_PATH" ]]; then
            sh_fail "Homebrew requires Xcode Command Line Tools."
        fi
        sh_info "Installing Homebrew..."
        if type "ruby" &> /dev/null; then
            ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        else
            (cd /usr/local; mkdir homebrew && curl -L https://github.com/Homebrew/homebrew/tarball/master | tar xz --strip 1 -C homebrew)
        fi
    fi
fi

# Install Taps/etc.
if type "brew" &> /dev/null; then
    sh_success "$(brew --version) installed: $(which brew)"
    sh_info "Updating Homebrew..."
    brew update
    # Setup taps.
    sh_info "Setting up Homebrew taps..."
    brew tap homebrew/bundle
    brew tap homebrew/completions
    brew tap homebrew/dupes
    brew tap homebrew/homebrew-php
    brew tap homebrew/nginx
    brew tap homebrew/versions
    # CASKROOM for OS X
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew tap caskroom/cask
        brew tap caskroom/fonts
        brew tap caskroom/versions
    fi
    # Remove outdated versions from the cellar.
    brew cleanup
    echo ""
fi

if type "brew" &> /dev/null; then
    sh_success "$(brew --version) installed: $(which brew)"
    echo ""
fi
