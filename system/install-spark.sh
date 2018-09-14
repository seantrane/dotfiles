#!/usr/bin/env bash
#
# Spark
# Sparklines for the shell
# http://zachholman.com/spark/

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

install_spark () {
    if ! type "spark" &> /dev/null; then
        sh_info "Installing spark..."
        if type "brew" &> /dev/null; then
            brew install spark
        elif type "apt-get" &> /dev/null; then
            sudo apt-get -y install spark
        elif type "yum" &> /dev/null; then
            sudo yum install spark
        fi
    fi

    if type "spark" &> /dev/null; then
        sh_success "$(spark --version) installed: $(which spark)"
    fi
}
install_spark
