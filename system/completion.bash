#!/usr/bin/env bash
#
# Tab completion for SSH hostnames, based on ~/.ssh/config, ignoring wildcards

if [[ -e "$HOME/.ssh/config" ]]; then
  complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;
fi
