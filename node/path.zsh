#!/usr/bin/env bash

# .node bin:
if [[ -d "$HOME/.node/bin" ]]; then
  export PATH="$HOME/.node/bin:$PATH"
fi

# .node node_modules:
if [[ -d "$HOME/.node/lib/node_modules" ]]; then
  export NODE_PATH="$HOME/.node/lib/node_modules:$NODE_PATH"
fi

# If Homebrew has NOT installed npm, you should supplement
# your NODE_PATH with the npm module folder:
# /usr/local/lib/node_modules
if type "brew" &> /dev/null && [[ "$(brew ls --versions node)" ]]; then
  export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"
fi
