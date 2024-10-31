# shellcheck shell=bash
#
# Shell Aliases
# shellcheck disable=SC2139

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

function chshell {
  grep -q "${HOMEBREW_PREFIX:-}/bin/${1:-zsh}" "/etc/shells" ||
    echo "${HOMEBREW_PREFIX:-}/bin/${1:-zsh}" >>/etc/shells
  chsh -s "${HOMEBREW_PREFIX:-}/bin/${1:-zsh}"
}

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Enable aliases to be sudo’ed
# alias sudo='sudo '
alias nsudo='nocorrect sudo'
alias sudo='my_sudo '
function my_sudo {
  while [[ $# -gt 0 ]]; do
    case "$1" in
    command)
      shift
      break
      ;;
    nocorrect | noglob) shift ;;
    *) break ;;
    esac
  done
  if [[ $# = 0 ]]; then
    command sudo zsh
  else
    # shellcheck disable=SC2068
    noglob command sudo $@
  fi
}

# Put OS to sleep/standby
alias sleepnow="pmset sleepnow"

# Get week number
alias week='date +%V'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Canonical hex dump; some systems have this symlinked
command -v hd >/dev/null || alias hd="hexdump -C"

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done
