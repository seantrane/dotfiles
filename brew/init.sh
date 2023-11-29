# shellcheck shell=bash
#
# Installation of Homebrew will be added to: PATH, MANPATH, INFOPATH.
# Variables exported: HOMEBREW_PREFIX, HOMEBREW_CELLAR, HOMEBREW_REPOSITORY.

# Use default init method provided by Homebrew.
if type "brew" &> /dev/null; then
  eval "$(brew shellenv)"
else
  # Set HOMEBREW_PREFIX, if unavailable.
  if [[ -z "${HOMEBREW_PREFIX:-}" ]]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
      if [[ "$(sysctl -n machdep.cpu.brand_string)" =~ "Apple" ]]; then
        # Apple Silicon has different Homebrew directory.
        HOMEBREW_PREFIX="/opt/homebrew"
      else
        # Default for Apple Intel.
        HOMEBREW_PREFIX="/usr/local"
      fi
    else
      # Default for Linux.
      HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
    fi
  fi
  export HOMEBREW_PREFIX

  # Add Homebrew to PATH.
  [[ -d "${HOMEBREW_PREFIX:-}" ]] && export PATH="${HOMEBREW_PREFIX:-}/bin:$PATH"

  # Try again to use default init method provided by Homebrew.
  if type "brew" &> /dev/null; then
    eval "$(brew shellenv)"
  else
    echo "[ERROR] Unable to find/load Homebrew. Please install."
  fi
fi
