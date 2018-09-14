#!/usr/bin/env bash
#
# Install Prezto
# https://github.com/sorin-ionescu/prezto

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if [ ! -d "$HOME/.zprezto" ]; then
    if type "git" &> /dev/null; then
        sh_info "Cloning Prezto to your home directory: ~/.prezto..."
        git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
    elif type "curl" &> /dev/null; then
        sh_info "Downloading/extracting Prezto to your home directory: ~/.prezto..."
        cd
        curl -LOk https://github.com/sorin-ionescu/prezto/archive/master.zip
        unzip master.zip
        mv prezto-master .prezto
        rm master.zip
    fi
    # Vagrant installations
    if [ -d "$HOME/.zprezto" ] && [ -d "/home/vagrant" ]; then
        sh_info "Cloning Prezto to your Vagrant directory: /home/vagrant/.prezto..."
        # copy ~/.zprezto for `vagrant` user
        cp -a "$HOME/.zprezto" "/home/vagrant/.zprezto"
        if [ -d "/home/vagrant/.zprezto" ]; then
            # change ownership to `vagrant` user
            chown -Rf vagrant /home/vagrant/.zprezto
            sh_success "Prezto installed: /home/vagrant/.zprezto"
        fi
    fi
fi

if [ -d "$HOME/.zprezto" ]; then
    sh_success "Prezto installed: $HOME/.zprezto"
fi
