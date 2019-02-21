#!/usr/bin/env bash

# php56 support:
if type "brew" &> /dev/null && [ "$(brew ls --versions php56)" ]; then
    export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
fi

# php70 support:
if type "brew" &> /dev/null && [ "$(brew ls --versions php70)" ]; then
    export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
fi
