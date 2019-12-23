#!/usr/bin/env bash

[[ -d "$HOME/terraform" ]] && export PATH="$HOME/terraform:$PATH"

[[ -d "/usr/local/terraform/bin" ]] && export PATH="/usr/local/terraform/bin:$PATH"
