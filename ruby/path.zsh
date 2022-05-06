#!/usr/bin/env bash
#
# Add PATH for gem executables

# If you need to have openssl@1.1 first in your PATH run:
# [[ -d "/usr/local/opt/openssl@1.1/bin" ]] && export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
# For compilers to find openssl@1.1 you may need to set:
# [[ -d "/usr/local/opt/openssl@1.1/lib" ]] && export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
# [[ -d "/usr/local/opt/openssl@1.1/include" ]] && export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
# For pkg-config to find openssl@1.1 you may need to set:
# [[ -d "/usr/local/opt/openssl@1.1/lib/pkgconfig" ]] && export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

# If you need to have ruby first in your PATH run:
[[ -d "/usr/local/opt/ruby/bin" ]] && export PATH="/usr/local/opt/ruby/bin:$PATH"
# For compilers to find ruby you may need to set:
[[ -d "/usr/local/opt/ruby/lib" ]] && export LDFLAGS="-L/usr/local/opt/ruby/lib"
[[ -d "/usr/local/opt/ruby/include" ]] && export CPPFLAGS="-I/usr/local/opt/ruby/include"
# For pkg-config to find ruby you may need to set:
[[ -d "/usr/local/opt/ruby/lib/pkgconfig" ]] && export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

# By default, binaries installed by gem will be placed into:
[[ -d "/usr/local/lib/ruby/gems/2.3.0/bin" ]] && export PATH="/usr/local/lib/ruby/gems/2.3.0/bin:$PATH"
[[ -d "/usr/local/lib/ruby/gems/2.4.0/bin" ]] && export PATH="/usr/local/lib/ruby/gems/2.4.0/bin:$PATH"
[[ -d "/usr/local/lib/ruby/gems/2.5.0/bin" ]] && export PATH="/usr/local/lib/ruby/gems/2.5.0/bin:$PATH"
[[ -d "/usr/local/lib/ruby/gems/2.6.0/bin" ]] && export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"
[[ -d "/usr/local/lib/ruby/gems/3.1.0/bin" ]] && export PATH="/usr/local/lib/ruby/gems/3.1.0/bin:$PATH"

[[ -d "$HOME/.gem/ruby/2.3.0/bin" ]] && export PATH="$HOME/.gem/ruby/2.3.0/bin:$PATH"
[[ -d "$HOME/.gem/ruby/2.4.0/bin" ]] && export PATH="$HOME/.gem/ruby/2.4.0/bin:$PATH"
[[ -d "$HOME/.gem/ruby/2.5.0/bin" ]] && export PATH="$HOME/.gem/ruby/2.5.0/bin:$PATH"
[[ -d "$HOME/.gem/ruby/2.6.0/bin" ]] && export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"
[[ -d "$HOME/.gem/ruby/3.1.0/bin" ]] && export PATH="$HOME/.gem/ruby/3.1.0/bin:$PATH"
