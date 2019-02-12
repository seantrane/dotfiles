#!/usr/bin/env bash
#
# OSX
#
# This installs some of the common dependencies for OSX.

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if [[ "$OSTYPE" == "darwin"* ]]; then

    # Install Homebrew
    ! type "brew" &> /dev/null && source $DOTFILES/brew/install.sh;

    # Install system/support utils
    source $DOTFILES/system/install.sh;

    if type "brew" &> /dev/null; then

        sh_info "Installing standard Linux/GNU utilities and software that OS X neglects..."

        if [ ! "$(brew ls --versions coreutils)" ]; then
            sh_info "Installing core-utilities (GNU File, Shell, and Text utilities)..."
            brew install coreutils
            # Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
        fi
        if [ "$(brew ls --versions coreutils)" ]; then
            sh_success "$(brew ls --versions coreutils) installed."
        fi

        # Install some other useful utilities like `sponge`.
        if [ ! "$(brew ls --versions moreutils)" ]; then
            sh_info "Installing more-utilities (collection of tools that nobody wrote when UNIX was young)..."
            brew install moreutils
        fi
        if [ "$(brew ls --versions moreutils)" ]; then
            sh_success "$(brew ls --versions moreutils) installed."
        fi

        # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
        if [ ! "$(brew ls --versions findutils)" ]; then
            sh_info "Installing find-utilities (collection of GNU find, xargs, and locate)..."
            brew install findutils
        fi
        if [ "$(brew ls --versions findutils)" ]; then
            sh_success "$(brew ls --versions findutils) installed."
        fi

        # Install GNU `sed`, overwriting the built-in `sed`.
        if [ ! "$(brew ls --versions gnu-sed)" ]; then
            sh_info "Installing gnu-sed (GNU implementation of the famous stream editor)..."
            brew install gnu-sed --with-default-names
        fi
        if [ "$(brew ls --versions gnu-sed)" ]; then
            sh_success "$(brew ls --versions gnu-sed) installed."
        fi

        # Install `pass`, `gpg`, `pwgen` for password management.
        if [ ! "$(brew ls --versions pass)" ]; then
            sh_info "Installing Password manager..."
            brew install pass
        fi
        if [ "$(brew ls --versions pass)" ]; then
            sh_success "$(brew ls --versions pass) installed."
        fi

        # Install `dnsmasq` for easier ip-host relationships.
        # if [ ! "$(brew ls --versions dnsmasq)" ]; then
        #     sh_info "Installing dnsmasq (Lightweight DNS forwarder and DHCP server)..."
        #     brew install dnsmasq
        # fi
        # if [ "$(brew ls --versions dnsmasq)" ]; then
        #     sh_success "$(brew ls --versions dnsmasq) installed."
        # fi

        # Install more recent versions of some OS X tools.
        sh_info "Installing more recent versions of some OS X tools..."

        if [ ! "$(brew ls --versions bzip2)" ]; then
            sh_info "Installing bzip2 (Freely available high-quality data compressor)..."
            brew install bzip2
        fi
        if [ "$(brew ls --versions bzip2)" ]; then
            sh_success "$(brew ls --versions bzip2) installed."
        fi

        if [ ! "$(brew ls --versions gcc)" ]; then
            sh_info "Installing gcc (GNU compiler collection)..."
            brew install gcc
        fi
        if [ "$(brew ls --versions gcc)" ]; then
            sh_success "$(brew ls --versions gcc) installed."
        fi

        if [ ! "$(brew ls --versions grep)" ]; then
            sh_info "Installing GNU Grep..."
            brew install grep
        fi
        if [ "$(brew ls --versions grep)" ]; then
            sh_success "$(brew ls --versions grep) installed."
        fi

        if [ ! "$(brew ls --versions libzip)" ]; then
            sh_info "Installing libzip (C library for reading, creating, and modifying zip archives)..."
            brew install libzip
        fi
        if [ "$(brew ls --versions libzip)" ]; then
            sh_success "$(brew ls --versions libzip) installed."
        fi

        if [ ! "$(brew ls --versions openssh)" ]; then
            sh_info "Installing OpenSSH (OpenBSD freely-licensed SSH connectivity tools)..."
            brew install openssh
        fi
        if [ "$(brew ls --versions openssh)" ]; then
            sh_success "$(brew ls --versions openssh) installed."
        fi

        if [ ! "$(brew ls --versions openssl)" ]; then
            sh_info "Installing OpenSSL (SSL/TLS cryptography library)..."
            brew install openssl
        fi
        if [ "$(brew ls --versions openssl)" ]; then
            sh_success "$(brew ls --versions openssl) installed."
        fi

        if [ ! "$(brew ls --versions screen)" ]; then
            sh_info "Installing GNU Screen..."
            brew install screen
        fi
        if [ "$(brew ls --versions screen)" ]; then
            sh_success "$(brew ls --versions screen) installed."
        fi

        if [ ! "$(brew ls --versions zlib)" ]; then
            sh_info "Installing zlib (General-purpose lossless data-compression library)..."
            brew install zlib
        fi
        if [ "$(brew ls --versions zlib)" ]; then
            sh_success "$(brew ls --versions zlib) installed."
        fi

        # if [ ! "$(brew ls --versions vim)" ]; then
        #     sh_info "Installing Vi \"workalike\" with many additional features..."
        #     brew install vim --override-system-vi
        # fi
        # if [ "$(brew ls --versions vim)" ]; then
        #     sh_success "$(brew ls --versions vim) installed."
        # fi

    # webkit2png
    # Create screenshots of webpages from the terminal
    # http://www.paulhammond.org/webkit2png/
    install_webkit2png () {
        if ! type "webkit2png" &> /dev/null; then
            if type "brew" &> /dev/null && [ ! "$(brew ls --versions webkit2png)" ]; then
                brew install webkit2png
            fi
        fi
        if type "webkit2png" &> /dev/null; then
            sh_success "$(webkit2png --version) installed: $(command -v webkit2png)"
        fi
    }
    # install_webkit2png

        sh_success "All OS X enhancements and utilities have been installed."

    fi

fi
