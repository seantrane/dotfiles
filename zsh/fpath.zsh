#!/usr/bin/env bash

#add each topic folder to fpath so that they can add functions and completion scripts
for topic_folder ($DOTFILES/*) if [[ -d $topic_folder ]]; then  fpath=($topic_folder $fpath); fi;

# To activate Homebrew-Zsh-completions, add to .zshrc:
if type "brew" &> /dev/null && [ -f "$(brew --prefix)/share/zsh-completions" ]; then
    fpath=("$(brew --prefix)/share/zsh-completions" $fpath)
fi
