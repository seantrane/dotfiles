#!/usr/bin/env bash
#
# Install PostGreSQL

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "postgres" &> /dev/null; then
    sh_info "Installing PostGreSQL..."
    if type "brew" &> /dev/null; then
        brew install postgresql
    elif type "apt-get" &> /dev/null; then
        # sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
        # wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
        # sudo apt-get update
        sudo apt-get -y install postgresql-common
        sudo apt-get -y install postgresql-9.3 libpq-dev
    elif type "yum" &> /dev/null; then
        sudo yum install postgresql
    fi
fi

if type "postgres" &> /dev/null; then
    sh_success "$(postgres --version) installed: $(command -v postgres)"
fi
