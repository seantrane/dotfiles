#!/usr/bin/env bash
#
# Install Ruby Version Manager (RVM)
# https://rvm.io

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

if ! type "rvm" &> /dev/null; then
    local action=
    sh_yesno "Do you want to install RVM?"
    read -r -n 1 action
    case "$action" in
        y )
            sh_info "Installing RVM..."
            cd
            # Paul does: curl -L https://get.rvm.io | bash -s stable --ruby
            # Simon does this one to add dependencies:
            \curl -sSL https://get.rvm.io | bash -s stable --rails --autolibs=enable
            ;;
    esac
fi

if type "rvm" &> /dev/null; then
    sh_success "RVM $(rvm --version) installed: $(which rvm)"
fi
