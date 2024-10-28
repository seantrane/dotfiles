#!/usr/bin/env bash
#
# init or install homebrew
#
# @see: https://brew.sh/
# @see: https://docs.brew.sh/Installation
# @see: https://docs.brew.sh/Homebrew-on-Linux
#
# Installation of Homebrew will be added to: PATH, MANPATH, INFOPATH.
# Variables exported: HOMEBREW_PREFIX, HOMEBREW_CELLAR, HOMEBREW_REPOSITORY.

#-------------------------------------------------------------------------------
# Shell Support
#-------------------------------------------------------------------------------

# shellcheck disable=SC1091
[[ -z "${SHELLSUPPORT:-}" ]] && {
  [[ -s "${DOTFILES:-"$HOME/.dotfiles"}/shell/response.sh" ]] \
   && . "${DOTFILES:-"$HOME/.dotfiles"}/shell/response.sh"
}

#-------------------------------------------------------------------------------
# CONSTANTS
#-------------------------------------------------------------------------------

_DOT_HOMEBREW_INSTALL="${_DOT_HOMEBREW_INSTALL:-}"

#-------------------------------------------------------------------------------
# FUNCTIONS
#-------------------------------------------------------------------------------

_init_homebrew () {
  if type "brew" &> /dev/null; then
    eval "$(brew shellenv)"
  else
    _set_homebrew_prefix
    [[ -x "${HOMEBREW_PREFIX:-}/bin/brew" ]] && \
    eval "$("$HOMEBREW_PREFIX"/bin/brew shellenv)"
    if ! type "brew" &> /dev/null; then
      sh_error "Unable to find/load Homebrew. Please install."
    fi
  fi
}

_init_or_install_homebrew () {
  if ! type "brew" &> /dev/null; then
    if [[ -n "$_DOT_HOMEBREW_INSTALL" ]]; then
      _install_homebrew
    else
      sh_yesno 'Would you like to install Homebrew?'
      read -r -e _answer
      [[ "$_answer" == "y"* ]] && _install_homebrew
    fi
  fi
  _init_homebrew
}

_install_command_line_tools () {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    if type "xcode-select" &> /dev/null; then
      sh_info "Installing Xcode Command Line Tools..."
      xcode-select --install
    else
      sh_error "'xcode-select' command not found."
      sh_fail "Please install Xcode and Command Line Tools."
    fi
  fi
}

_install_homebrew () {
  # Bypass if Homebrew is already installed.
  type "brew" &> /dev/null && return 0
  # Install macOS dependencies.
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sh_note 'Homebrew requires Xcode Command Line Tools.'
    _install_command_line_tools
    if [[ ! "$XCODE_PATH" ]]; then
      sh_fail 'Homebrew requires Xcode Command Line Tools.'
    fi
  elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    _install_linuxbrew_deps
  fi
  sh_info "Installing Homebrew..."
  _brew_dist='https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh'
  if /bin/bash -c "$(curl -fsSL "$_brew_dist")"; then
    _init_homebrew
    sh_success 'Homebrew installed successfully.'
  else
    sh_error 'Supported install of Homebrew was not successful.'
    sh_note 'Attempting a manual install of Homebrew.'
    _install_homebrew_unsupported
  fi
}

_install_homebrew_unsupported () {
  _set_homebrew_prefix
  mkdir -p "$HOMEBREW_PREFIX" || \
    sh_fail "Failed to create homebrew directory: $HOMEBREW_PREFIX"
  _brew_dist='https://github.com/Homebrew/homebrew/tarball/master'
  curl -L "$_brew_dist" | tar xz --strip 1 -C "$HOMEBREW_PREFIX"
  test -e "$HOMEBREW_PREFIX/bin/brew" || \
    sh_fail "Failed to locate homebrew binary: $HOMEBREW_PREFIX/bin/brew"
  eval "$("$HOMEBREW_PREFIX"/bin/brew shellenv)"
  brew update --force --quiet
  chmod -R go-w "$(brew --prefix)/share/zsh"
}

# Install Linuxbrew dependencies.
# @see https://github.com/Linuxbrew/linuxbrew#dependencies
_install_linuxbrew_deps () {
  if [[ "$OSTYPE" == "linux-gnu" ]]; then
    if type "apt-get" &> /dev/null; then
      sh_info "Installing Homebrew dependencies for Debian, Ubuntu."
      sudo apt-get install \
        build-essential \
        curl \
        git \
        m4 \
        python-setuptools \
        ruby \
        texinfo \
        libbz2-dev \
        libcurl4-openssl-dev \
        libexpat-dev \
        libncurses-dev \
        zlib1g-dev \
        ;
    elif type "yum" &> /dev/null; then
      sh_info "Installing Homebrew dependencies for Fedora, CentOS, Red Hat."
      sudo yum groupinstall 'Development Tools' && sudo yum install \
        curl \
        git \
        irb \
        m4 \
        python-setuptools \
        ruby \
        texinfo \
        bzip2-devel \
        curl-devel \
        expat-devel \
        ncurses-devel \
        zlib-devel \
        ;
    fi
  fi
}

# shellcheck disable=SC2120
_set_homebrew_prefix () {
  HOMEBREW_PREFIX="${1:-${HOMEBREW_PREFIX:-}}"
  if [[ -z "$HOMEBREW_PREFIX" ]]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
      # macOS Intel
      HOMEBREW_PREFIX="/usr/local"
      # Apple Silicon
      [[ "$(sysctl -n machdep.cpu.brand_string)" =~ "Apple" ]] && \
      HOMEBREW_PREFIX="/opt/homebrew"
    elif [[ "$OSTYPE" == "linux-gnu" ]]; then
      # Linux
      HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
    fi
  fi
  [[ -n "$HOMEBREW_PREFIX" ]] && export HOMEBREW_PREFIX
}

#-------------------------------------------------------------------------------
# EXPORTS
#-------------------------------------------------------------------------------

# main () {
#   _init_or_install_homebrew
# }
# main "$@" # Uncomment to enable executable.

export \
  _init_homebrew \
  _init_or_install_homebrew \
  _install_homebrew \
  _install_homebrew_unsupported \
  _set_homebrew_prefix \
  ;
