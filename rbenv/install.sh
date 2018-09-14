#!/usr/bin/env bash
#
# Install Ruby-environment (rbenv)

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

# Install Ruby-environment (rbenv)
if ! type "rbenv" &> /dev/null; then
    # For Mac; rbenv is best installed using Homebrew
    if ! type "brew" &> /dev/null && [[ "$OSTYPE" == "darwin"* ]]; then
        source $DOTFILES/brew/install.sh
    fi
    # For Linux/*; rbenv requires Git, so let's install that too
    ! type "git" &> /dev/null && source $DOTFILES/git/install.sh

    sh_info "Installing Ruby-environment (rbenv) and Ruby-build..."
    if type "brew" &> /dev/null; then
        brew install rbenv ruby-build
    elif type "git" &> /dev/null; then
        cd
        git clone git://github.com/sstephenson/rbenv.git .rbenv
        git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
        git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
    fi
    # Initiate rbenv
    source $( cd "${BASH_SOURCE%/*}" && pwd )/init.zsh
    # Restart Shell
    exec $SHELL
fi

if type "rbenv" &> /dev/null; then
    sh_success "$(rbenv --version) installed: $(which rbenv)"
fi

if type "ruby-build" &> /dev/null; then
    sh_success "$(ruby-build --version) installed: $(which ruby-build)"
fi
