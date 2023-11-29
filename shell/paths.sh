# shellcheck shell=bash
#
# PATH / MANPATH exports
#
# Defines the $PATH export/variable for shell environments.

type "find_files" &> /dev/null || . "$DOTFILES/functions/find_files"

#-------------------------------------------------------------------------------
# BINARIES/SCRIPTS
#-------------------------------------------------------------------------------
# This will ensure proper loading/ordering of PATHs.

# DEFAULT `$PATH`
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Add `/usr/local/{sbin,bin}` to the `$PATH`
[[ -d "/usr/local/bin" ]] && export PATH="/usr/local/bin:$PATH"
[[ -d "/usr/local/sbin" ]] && export PATH="/usr/local/sbin:$PATH"

# Add `~/.dotfiles/{sbin,bin}` to the `$PATH`
[[ -d "$DOTFILES/bin" ]] && export PATH="$DOTFILES/bin:$PATH"
[[ -d "$DOTFILES/sbin" ]] && export PATH="$DOTFILES/sbin:$PATH"

# Add `~/.local/{sbin,bin}` to the `$PATH`
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"
[[ -d "$HOME/.local/sbin" ]] && export PATH="$HOME/.local/sbin:$PATH"

# Add `~/{sbin,bin}` to the `$PATH`
[[ -d "$HOME/bin" ]] && export PATH="$HOME/bin:$PATH"
[[ -d "$HOME/sbin" ]] && export PATH="$HOME/sbin:$PATH"

# LOAD DOTFILES PATHS:
# for file in ~/.dotfiles/{git,system}/path.sh; do
_find_files_array=($(find -H "$DOTFILES" -maxdepth 2 -perm -u+r -type f -name 'path.sh'))
for _file_path in "${_find_files_array[@]}"; do
  . "$_file_path"
done
unset _file_path _find_files_array

# CUSTOM/USER PATHS
# `~/.path` can be used to extend `$PATH`.
# shellcheck disable=SC1090
[[ -f "$HOME/.path" ]] && . "$HOME/.path"

# Ensure Homebrew path comes first
export PATH="/opt/homebrew/bin:$PATH"

#-------------------------------------------------------------------------------
# HELP DOCS/MANUALS
#-------------------------------------------------------------------------------

[[ -d "${HOMEBREW_PREFIX:-}/man" ]] && export MANPATH="${HOMEBREW_PREFIX:-}/man:$MANPATH"

# .local manuals:
[[ -d "$HOME/.local/man" ]] && export MANPATH="$HOME/.local/man:$MANPATH"

#-------------------------------------------------------------------------------
# CLEANUP PATH, MANPATH - Ensure arrays do not contain duplicates.
#-------------------------------------------------------------------------------

if type "awk" &> /dev/null; then
  PATH=$(echo -n "$PATH" | awk -v RS=: '{ if (!arr[$0]++) {printf("%s%s",!ln++?"":":",$0)}}')
  export PATH

  MANPATH=$(echo -n "$MANPATH" | awk -v RS=: '{ if (!arr[$0]++) {printf("%s%s",!ln++?"":":",$0)}}')
  export MANPATH
fi
