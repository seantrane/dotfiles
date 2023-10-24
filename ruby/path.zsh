#!/usr/bin/env bash
#
# Add PATH for gem executables

# If you need to have openssl@1.1 first in your PATH run:
# [[ -d "$(brew --prefix openssl@1.1)/bin" ]] && export PATH="$(brew --prefix openssl@1.1)/bin:$PATH"
# For compilers to find openssl@1.1 you may need to set:
# [[ -d "$(brew --prefix openssl@1.1)/lib" ]] && export LDFLAGS="-L$(brew --prefix openssl@1.1)/lib"
# [[ -d "$(brew --prefix openssl@1.1)/include" ]] && export CPPFLAGS="-I$(brew --prefix openssl@1.1)/include"
# For pkg-config to find openssl@1.1 you may need to set:
# [[ -d "$(brew --prefix openssl@1.1)/lib/pkgconfig" ]] && export PKG_CONFIG_PATH="$(brew --prefix openssl@1.1)/lib/pkgconfig"

# If you need to have ruby first in your PATH run:
[[ -d "$(brew --prefix ruby)/bin" ]] && export PATH="$(brew --prefix ruby)/bin:$PATH"
# For compilers to find ruby you may need to set:
[[ -d "$(brew --prefix ruby)/lib" ]] && export LDFLAGS="-L$(brew --prefix ruby)/lib"
[[ -d "$(brew --prefix ruby)/include" ]] && export CPPFLAGS="-I$(brew --prefix ruby)/include"
# For pkg-config to find ruby you may need to set:
[[ -d "$(brew --prefix ruby)/lib/pkgconfig" ]] && export PKG_CONFIG_PATH="$(brew --prefix ruby)/lib/pkgconfig"

# By default, binaries installed by gem will be placed into:
[[ -d "$(brew --prefix)/lib/ruby/gems/2.3.0/bin" ]] && export PATH="$(brew --prefix)/lib/ruby/gems/2.3.0/bin:$PATH"
[[ -d "$(brew --prefix)/lib/ruby/gems/2.4.0/bin" ]] && export PATH="$(brew --prefix)/lib/ruby/gems/2.4.0/bin:$PATH"
[[ -d "$(brew --prefix)/lib/ruby/gems/2.5.0/bin" ]] && export PATH="$(brew --prefix)/lib/ruby/gems/2.5.0/bin:$PATH"
[[ -d "$(brew --prefix)/lib/ruby/gems/2.6.0/bin" ]] && export PATH="$(brew --prefix)/lib/ruby/gems/2.6.0/bin:$PATH"
[[ -d "$(brew --prefix)/lib/ruby/gems/3.1.0/bin" ]] && export PATH="$(brew --prefix)/lib/ruby/gems/3.1.0/bin:$PATH"

[[ -d "$HOME/.gem/ruby/2.3.0/bin" ]] && export PATH="$HOME/.gem/ruby/2.3.0/bin:$PATH"
[[ -d "$HOME/.gem/ruby/2.4.0/bin" ]] && export PATH="$HOME/.gem/ruby/2.4.0/bin:$PATH"
[[ -d "$HOME/.gem/ruby/2.5.0/bin" ]] && export PATH="$HOME/.gem/ruby/2.5.0/bin:$PATH"
[[ -d "$HOME/.gem/ruby/2.6.0/bin" ]] && export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"
[[ -d "$HOME/.gem/ruby/3.1.0/bin" ]] && export PATH="$HOME/.gem/ruby/3.1.0/bin:$PATH"
