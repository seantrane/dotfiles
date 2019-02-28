#!/usr/bin/env bash
#
# Add PATH for gem executables

[[ -d "$HOME/.gem/ruby/2.3.0/bin" ]] && export PATH="$HOME/.gem/ruby/2.3.0/bin:$PATH"
[[ -d "$HOME/.gem/ruby/2.4.0/bin" ]] && export PATH="$HOME/.gem/ruby/2.4.0/bin:$PATH"
[[ -d "$HOME/.gem/ruby/2.5.0/bin" ]] && export PATH="$HOME/.gem/ruby/2.5.0/bin:$PATH"
[[ -d "$HOME/.gem/ruby/2.6.0/bin" ]] && export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"
