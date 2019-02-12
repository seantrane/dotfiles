#!/usr/bin/env bash
#
# Install Zshell

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

sh_info "Installing/updating Zshell + zsh-completions..."
if type "brew" &> /dev/null; then
    # Install Zsh and Zsh completions
    brew install --without-etcdir zsh zsh-completions
    # Install oh-my-zsh on top of zsh to getting additional functionality
    #curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
    # Add the new shell to the list of allowed shells
    if [ -e "$(brew --prefix)/bin/zsh" ]; then
        sh_info "Adding Zsh to your allowed shells (/etc/shells)..."
        if type "tee" &> /dev/null; then
            sudo tee -a /etc/shells <<<"$(brew --prefix)/bin/zsh"
        else
            sudo bash -c 'echo "$(brew --prefix)/bin/zsh" >> /etc/shells'
        fi
    fi
elif type "apt-get" &> /dev/null; then
    sudo apt-get -y install zsh
elif type "yum" &> /dev/null; then
    sudo yum install zsh
fi

if type "zsh" &> /dev/null; then
    sh_success "$(zsh --version) installed: $(command -v zsh)"
    # Make Zsh your default shell.
    # This will not work if Zsh is not in your authorized shells list (/etc/shells).
    action=
    sh_yesno "Make Zsh your default shell?"
    read -r -n 1 action
    case "$action" in
        y )
            sh_info "Make Zsh your default shell..."
            sh_note "This will not work if Zsh is not in your authorized shells list (/etc/shells)."
            # chsh -s $(chsh -l | grep "zsh" -m 1)
            chsh -s "$(command -v zsh)"
            sh_alert "Restart your terminal to apply changes."
            ;;
    esac

    sh_note "Your active shell is: $SHELL"
fi
