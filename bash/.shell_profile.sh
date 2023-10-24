#!/usr/bin/env bash
#
# LOGIN OUTPUT
#
# Prints to STDOUT: user, machine, and shell profile information.
#
# Include/source in '~/.bashrc' or '~/.zshrc'
#
# Output will have color if "color variables" are defined.
#
# shellcheck disable=SC1090,SC1091

THIS_USER=${USER:-$(id -un || echo "\u")}
THIS_HOST=${HOST:-${HOSTNAME:-$(hostname || echo "\h")}}
THIS_SYS=${UTYPE:-${OSTYPE:-$(uname || echo "")}}
THIS_MACH=${UMACH:-${MACHTYPE:-$(uname -m || echo "")}}
THIS_ARCH=${UARCH:-${HOSTTYPE:-$(uname -p || echo "")}}

LOGIN_OUTPUT="${Reset:-}${ClearNewLine:-}\n"
LOGIN_OUTPUT+="${Cyan:-}SYSTEM ❯ ${THIS_SYS} ${THIS_MACH} ${THIS_ARCH}\n"
LOGIN_OUTPUT+="${Red:-}SHELL  ❯ $(${SHELL:-} --version | head -n 1)\n"
LOGIN_OUTPUT+="${Yellow:-}USER   ❯ ${THIS_USER:-} @ ${THIS_HOST} (${LANG:-})\n"
LOGIN_OUTPUT+="${Green:-}HOME   ❯ ${HOME:-}\n"
LOGIN_OUTPUT+="${Reset:-}"

echo -e "${LOGIN_OUTPUT}"
