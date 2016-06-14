#!/usr/bin/env bash
#
# PATH / MANPATH exports
#
# Defines the $PATH export/variable for shell environments.

#-----------------------------------------------------------------------
# BINARIES/SCRIPTS
#-----------------------------------------------------------------------
# This will ensure proper loading/ordering of PATHs.

# DEFAULT `$PATH`
export PATH="/usr/sbin:/usr/bin:./sbin:./bin:/sbin:/bin:$PATH"

# LOAD DOTFILES PATHS:
# for file in ~/.dotfiles/{git,system}/path.zsh; do
for file in $(find -H "$DOTFILES" -maxdepth 2 -name 'path.zsh'); do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

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

# CUSTOM/USER PATHS
# `~/.path` can be used to extend `$PATH`.
[[ -f "$HOME/.path" ]] && source "$HOME/.path"

# PATH CLEANUP
# Ensure PATH array does not contain duplicates.
PATH=`echo -n $PATH | awk -v RS=: '{ if (!arr[$0]++) {printf("%s%s",!ln++?"":":",$0)}}'`
export PATH

#-----------------------------------------------------------------------
# HELP DOCS/MANUALS
#-----------------------------------------------------------------------

[[ -d "/usr/local/man" ]] && export MANPATH="/usr/local/man:$MANPATH"

# .local manuals:
[[ -d "$HOME/.local/man" ]] && export PATH="$HOME/.local/man:$MANPATH"

# MANPATH CLEANUP
# Ensure MANPATH array does not contain duplicates.
MANPATH=`echo -n $MANPATH | awk -v RS=: '{ if (!arr[$0]++) {printf("%s%s",!ln++?"":":",$0)}}'`
export MANPATH
