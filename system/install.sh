#!/usr/bin/env bash
#
# System/support install

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

DOTSYSTEM=$( cd "${BASH_SOURCE%/*}" && pwd )

# GRC colorizes nifty unix tools all over the place
. "$DOTSYSTEM/install-grc.sh"

# spark: Sparklines for the shell
. "$DOTSYSTEM/install-spark.sh"

# ack: Search tool like grep, but optimized for programmers
. "$DOTSYSTEM/install-ack.sh"

# ImageMagick (convert): Tools and libraries to manipulate images in many formats
. "$DOTSYSTEM/install-imagemagick.sh"

# p7zip: 7-Zip (high compression file archiver) implementation
. "$DOTSYSTEM/install-p7zip.sh"

# pv: Monitor data's progress through a pipe
. "$DOTSYSTEM/install-pv.sh"

# rename: Perl-powered file rename script with many helpful built-ins
. "$DOTSYSTEM/install-rename.sh"

# ssh-copy-id: Add a public key to a remote machine's authorized_keys file
. "$DOTSYSTEM/install-sshcopyid.sh"

# tree: Display directories as trees (with optional color/HTML output)
. "$DOTSYSTEM/install-tree.sh"

# Wine Is Not an Emulator
. "$DOTSYSTEM/install-wine.sh"

# exiv2: EXIF and IPTC metadata manipulation library and tools
# . "$DOTSYSTEM/install-exiv2.sh"

# lua: Powerful, lightweight programming language
# . "$DOTSYSTEM/install-lua.sh"

# lynx: Text-based web browser
# . "$DOTSYSTEM/install-lynx.sh"

# pigz: Parallel gzip
# . "$DOTSYSTEM/install-pigz.sh"

# rhino: JavaScript engine (Mozilla.org)
# . "$DOTSYSTEM/install-rhino.sh"

# speedtest_cli: Command-line interface for http://speedtest.net bandwidth tests
# . "$DOTSYSTEM/install-speedtest.sh"

# zopfli: New zlib (gzip, deflate) compatible compressor
# . "$DOTSYSTEM/install-zopfli.sh"
