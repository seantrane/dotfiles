#!/usr/bin/env bash

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
# shellcheck disable=SC1090
[[ -f "$(brew --prefix)/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh" ]] && . "$(brew --prefix)/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh"
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
# shellcheck disable=SC1090
[[ -f "$(brew --prefix)/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh" ]] && . "$(brew --prefix)/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh"
