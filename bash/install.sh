#!/usr/bin/env bash
#
# Install Bash 4
#
# This installs Bash and common extensions using Homebrew.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
#
# shellcheck disable=SC1090,SC1091

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

sh_info "Installing/updating Bash + bash-completions..."
if type "brew" &> /dev/null; then
    sh_info "Installing Bash..."
    brew install bash bash-completion2
    # Add the new shell to the list of allowed shells
    if [[ -e "$(brew --prefix)/bin/bash" ]]; then
        sh_info "Adding Bash to your allowed shells (/etc/shells)..."
        if type "tee" &> /dev/null; then
            sudo tee -a /etc/shells <<<"$(brew --prefix)/bin/bash"
        else
            sudo bash -c 'echo "$(brew --prefix)/bin/bash" >> /etc/shells'
        fi
    fi
elif type "apt-get" &> /dev/null; then
    sudo apt-get -y install bash bash-completion2
elif type "yum" &> /dev/null; then
    sudo yum install bash bash-completion2
fi

if type "bash" &> /dev/null; then
    sh_success "$(bash --version) installed: $(command -v bash)"
fi
