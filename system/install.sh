#!/usr/bin/env bash
#
# System/support install

# Shell Support
[[ -z "$SHELLSUPPORT" ]] && source $( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh

DOTSYSTEM=$( cd "${BASH_SOURCE%/*}" && pwd )

# GRC colorizes nifty unix tools all over the place
source $DOTSYSTEM/install-grc.sh

# spark: Sparklines for the shell
source $DOTSYSTEM/install-spark.sh

# ack: Search tool like grep, but optimized for programmers
source $DOTSYSTEM/install-ack.sh

# ImageMagick (convert): Tools and libraries to manipulate images in many formats
source $DOTSYSTEM/install-imagemagick.sh

# p7zip: 7-Zip (high compression file archiver) implementation
source $DOTSYSTEM/install-p7zip.sh

# pv: Monitor data's progress through a pipe
source $DOTSYSTEM/install-pv.sh

# rename: Perl-powered file rename script with many helpful built-ins
source $DOTSYSTEM/install-rename.sh

# ssh-copy-id: Add a public key to a remote machine's authorized_keys file
source $DOTSYSTEM/install-sshcopyid.sh

# tree: Display directories as trees (with optional color/HTML output)
source $DOTSYSTEM/install-tree.sh

# Wine Is Not an Emulator
source $DOTSYSTEM/install-wine.sh

# exiv2: EXIF and IPTC metadata manipulation library and tools
# source $DOTSYSTEM/install-exiv2.sh

# lua: Powerful, lightweight programming language
# source $DOTSYSTEM/install-lua.sh

# lynx: Text-based web browser
# source $DOTSYSTEM/install-lynx.sh

# pigz: Parallel gzip
# source $DOTSYSTEM/install-pigz.sh

# rhino: JavaScript engine (Mozilla.org)
# source $DOTSYSTEM/install-rhino.sh

# speedtest_cli: Command-line interface for http://speedtest.net bandwidth tests
# source $DOTSYSTEM/install-speedtest.sh

# zopfli: New zlib (gzip, deflate) compatible compressor
# source $DOTSYSTEM/install-zopfli.sh
