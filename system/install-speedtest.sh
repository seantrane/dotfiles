#!/usr/bin/env bash
#
# speedtest_cli
# Command-line interface for http://speedtest.net bandwidth tests
# https://github.com/sivel/speedtest-cli

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

install_speedtest_cli () {
    if ! type "speedtest_cli" &> /dev/null; then
        sh_info "Installing speedtest_cli..."
        if type "brew" &> /dev/null; then
            brew install speedtest_cli
        elif type "apt-get" &> /dev/null; then
            sudo apt-get -y install speedtest_cli
        elif type "yum" &> /dev/null; then
            sudo yum install speedtest_cli
        fi
    fi

    if type "speedtest_cli" &> /dev/null; then
        sh_success "$(speedtest_cli --version) installed: $(which speedtest_cli)"
    fi
}
install_speedtest_cli
