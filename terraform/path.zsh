#!/usr/bin/env bash

[[ -d "$HOME/terraform" ]] && export PATH="$HOME/terraform:$PATH"

[[ -d "/$(brew --prefix terraform)/bin" ]] && export PATH="/$(brew --prefix terraform)/bin:$PATH"
