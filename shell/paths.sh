# shellcheck shell=bash disable=SC1090,SC1091
#
# PATH / MANPATH exports
# Defines the $PATH export/variable for shell environments.

type "find_files" &>/dev/null || . "$DOTFILES/functions/find_files"

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
for _file in $(find_files "$DOTFILES" 'path.sh' 2); do . "$_file"; done
unset _file

#-------------------------------------------------------------------------------
# HOMEBREW
#-------------------------------------------------------------------------------

# Homebrew init.
[[ -f "$DOTFILES/brew/init_install.sh" ]] && . "$DOTFILES/brew/init_install.sh" &&
  _init_homebrew

# Add Linuxbrew PATHs (to your .bashrc or .zshrc):
_lbrewd="$HOME/.linuxbrew"
if [[ -d "$_lbrewd" ]]; then
  PATH="$_lbrewd/bin:$PATH"
  MANPATH="$_lbrewd/share/man:$MANPATH"
  INFOPATH="$_lbrewd/share/info:$INFOPATH"
fi

# Homebrew path must come first to override system binaries.
PATH="${HOMEBREW_PREFIX:-/usr/local}/bin:$PATH"

# Whalebrew binaries, when available, should override Homebrew.
[[ -d "/opt/whalebrew/bin" ]] && PATH="/opt/whalebrew/bin:$PATH"

#-------------------------------------------------------------------------------
# RANCHER
#-------------------------------------------------------------------------------

# Rancher - finally, so Rancher can control docker, kubectl, helm, etc.
[[ -d "$HOME/.rd/bin" ]] && PATH="$HOME/.rd/bin:$PATH"

#-------------------------------------------------------------------------------
# CUSTOM/USER PATHS
#-------------------------------------------------------------------------------

# `~/.path` can be used to extend `$PATH`.
[[ -f "$HOME/.path" ]] && . "$HOME/.path"

#-------------------------------------------------------------------------------
# HELP DOCS/MANUALS
#-------------------------------------------------------------------------------

[[ -d "${HOMEBREW_PREFIX:-}/man" ]] && MANPATH="${HOMEBREW_PREFIX:-}/man:$MANPATH"

# .local manuals:
[[ -d "$HOME/.local/man" ]] && MANPATH="$HOME/.local/man:$MANPATH"

#-------------------------------------------------------------------------------
# CLEANUP PATH, MANPATH - Ensure arrays do not contain duplicates.
#-------------------------------------------------------------------------------

if type "awk" &>/dev/null; then
  PATH=$(echo -n "$PATH" | awk -v RS=: '{ if (!arr[$0]++) {printf("%s%s",!ln++?"":":",$0)}}')

  MANPATH=$(echo -n "$MANPATH" | awk -v RS=: '{ if (!arr[$0]++) {printf("%s%s",!ln++?"":":",$0)}}')
fi

export LDFLAGS CPPFLAGS PKG_CONFIG_PATH
export PATH MANPATH INFOPATH
