# shellcheck shell=bash disable=SC2139
#
# LSCOLORS & LS COLORS + aliases
#
# @see: https://gist.github.com/seantrane/e13706494a54bd3a6c2456608ea68c7e

#-------------------------------------------------------------------------------
# LS ALIASES
#-------------------------------------------------------------------------------
# Detect which `ls` flavor is in use.
# FreeBSD, older versions of macOS, have different ls command.
if ls --color > /dev/null 2>&1; then
  colorflag="--color=always"
else
  colorflag="-G"
fi
# Use GNU ls, if installed by Homebrew.
# Always use color output for `ls`.
if [[ -r "${HOMEBREW_PREFIX:-}/bin/gls" ]]; then
  alias ls="command ${HOMEBREW_PREFIX:-}/bin/gls ${colorflag}"
else
  alias ls="command ls ${colorflag}"
fi
# Set time style flag, according to `ls` flavor.
if [[ ! -r "${HOMEBREW_PREFIX:-}/bin/gls" ]] && ls -T > /dev/null 2>&1; then
  timeflag="-T"
else
  timeflag="--time-style=long-iso"
fi
# List all files colorized in long format.
alias l="ls -lhF ${timeflag}"
# List all files colorized in long format, including dot files.
alias la="ls -lahF ${timeflag}"
# List, rescursively, all files colorized in long format, including dot files.
alias lsr="ls -lahFR ${timeflag}"
# List only directories
alias lsd="ls -d ${timeflag} */"
alias lsdl="ls -dl ${timeflag} */"

#-------------------------------------------------------------------------------
# LSCOLORS
#-------------------------------------------------------------------------------
# The value of this variable describes what color to use when colors are enabled
# with `CLICOLOR`.
export CLICOLOR=1

# The `LSCOLORS` string is a concatenation of pairs of the format `fb`,
# where `f` is the foreground color and `b` is the background color.
#
# The color designators are as follows:
#
# | Code | Description                               |
# |:----:|:------------------------------------------|
# | `a`  | black                                     |
# | `b`  | red                                       |
# | `c`  | green                                     |
# | `d`  | brown                                     |
# | `e`  | blue                                      |
# | `f`  | magenta                                   |
# | `g`  | cyan                                      |
# | `h`  | light grey                                |
# | `A`  | bold black, usually shows up as dark grey |
# | `B`  | bold red                                  |
# | `C`  | bold green                                |
# | `D`  | bold brown, usually shows up as yellow    |
# | `E`  | bold blue                                 |
# | `F`  | bold magenta                              |
# | `G`  | bold cyan                                 |
# | `H`  | bold light grey; looks like bright white  |
# | `x`  | default foreground or background          |
#
# Note that the above are standard ANSI colors. The actual display may
# differ depending on the color capabilities of the terminal in use.

# The default is `exfxcxdxbxegedabagacad`, i.e. blue foreground and
# default background for regular directories, black foreground and
# red background for `setuid` executables, etc.
# LSCOLORS='exfxcxdxbxegedabagacad'
# The order of the attributes are as follows:
_lscolors=(
  'ex' # 01. directory
  'Dx' # 02. symbolic link
  'fx' # 03. socket
  'dx' # 04. pipe
  'cx' # 05. executable
  'da' # 06. block special
  'da' # 07. character special
  'ab' # 08. executable with `setuid` bit set
  'ag' # 09. executable with `setgid` bit set
  'ac' # 10. directory writable to others, with sticky bit
  'ad' # 11. directory writable to others, without sticky bit
)
# Merge array into properly formatted string.
_ogIFS=$IFS
IFS=''
export LSCOLORS="${_lscolors[*]}"
IFS=$_ogIFS

#-------------------------------------------------------------------------------
# LS COLORS
#-------------------------------------------------------------------------------
#
# `LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31'`
#
# Parameters for `LS_COLORS` (`di`, `fi`, ...) refer to different file types:
#
# | Code | Description                                                     |
# |:----:|:----------------------------------------------------------------|
# | `no` | No color code at all                                            |
# | `fi` | Regular file: use no color at all                               |
# | `rs` | Reset to "normal" color                                         |
# | `di` | Directory                                                       |
# | `ln` | Symbolic Link                                                   |
# | `mh` | MULTIHARDLINK - regular file with more than one link            |
# | `pi` | Named pipe, Fifo file                                           |
# | `so` | Socket file                                                     |
# | `do` | Door file                                                       |
# | `bd` | Block device driver, (buffered) special file                    |
# | `cd` | Character device driver, (unbuffered) special file              |
# | `or` | Orphan symlink to nonexistent file, or non-`stat`'able file     |
# | `mi` | Non-existent file symlinked (visible when you type `ls -l`)     |
# | `su` | Normal file that is `setuid` (`u+s`)                            |
# | `sg` | Normal file that is `setgid` (`g+s`)                            |
# | `ca` | File with capability (very expensive to lookup)                 |
# | `tw` | Directory that is sticky and other-writable (`+t`,`o+w`)        |
# | `ow` | Directory that is other-writable (`o+w`) and not sticky         |
# | `st` | Directory with the sticky bit set (`+t`) and not other-writable |
# | `ex` | File which is executable (ie. has `x` set in permissions)       |
#
# ### Color Codes
#
# |  Code | Description                            |
# |------:|:---------------------------------------|
# |   `0` | Default Color                          |
# |   `1` | Bold                                   |
# |   `2` | Dim                                    |
# |   `3` | Italic                                 |
# |   `4` | Underlined                             |
# |   `5` | Blinking Text                          |
# |   `7` | Reverse Text                           |
# |   `8` | Conceal Text (Hidden)                  |
# |  `30` | Black                                  |
# |  `31` | Red                                    |
# |  `32` | Green                                  |
# |  `33` | Yellow                                 |
# |  `34` | Blue                                   |
# |  `35` | Magenta                                |
# |  `36` | Cyan                                   |
# |  `37` | White/Grey                             |
# |  `39` | Default                                |
# |  `40` | Black Background                       |
# |  `41` | Red Background                         |
# |  `42` | Green Background                       |
# |  `43` | Yellow Background                      |
# |  `44` | Blue Background                        |
# |  `45` | Magenta Background                     |
# |  `46` | Cyan Background                        |
# |  `47` | White/Grey Background                  |
# |  `49` | Default Background                     |
# |  `90` | Black - High Intensity                 |
# |  `91` | Red - High Intensity                   |
# |  `92` | Green - High Intensity                 |
# |  `93` | Yellow - High Intensity                |
# |  `94` | Blue - High Intensity                  |
# |  `95` | Magenta - High Intensity               |
# |  `96` | Cyan - High Intensity                  |
# |  `97` | White/Grey - High Intensity            |
# |  `99` | Default - High Intensity               |
# | `100` | Black Background - High Intensity      |
# | `101` | Red Background - High Intensity        |
# | `102` | Green Background - High Intensity      |
# | `103` | Yellow Background - High Intensity     |
# | `104` | Blue Background - High Intensity       |
# | `105` | Magenta Background - High Intensity    |
# | `106` | Cyan Background - High Intensity       |
# | `107` | White/Grey Background - High Intensity |
# | `109` | Default Background - High Intensity    |
#
# These codes can also be combined with one another:
#     di=5;34;43

# Reusable color combos
_ls_audio="35"
_ls_code="37"
_ls_exec="01;32"
_ls_hide="02;30"
_ls_hush="02;37"
_ls_image="36"
_ls_special="33"
_ls_video="94"
_ls_zip="03;34"

# Colorize tree even when used in pipes
# 'typeset' disabled so that this file can be sourced in both Bash and Zsh.
# typeset -Tgx LS_COLORS ls_colors ':'
ls_colors=(
  # Parameters for `LS_COLORS` (`di`, `fi`, ...) refer to different file types:
  'no=00'       # no = No color code at all
  'fi=00'       # fi = Regular file: use no color at all
  'rs=0'        # rs = Reset to "normal" color
  'di=01;34'    # di = Directory
  'ln=03;93'    # ln = Symbolic Link
  'mh=00'       # mh = MULTIHARDLINK - regular file with more than one link
  'pi=40;33'    # pi = Named pipe, Fifo file
  'so=01;35'    # so = Socket file
  'do=01;35'    # do = Door file
  'bd=40;33;01' # bd = Block device driver, (buffered) special file
  'cd=40;33;01' # cd = Character device driver, (unbuffered) special file
  'or=40;31;03' # or = Orphan symlink to nonexistent file, or non-stat'able file
  'mi=00'       # mi = Non-existent file symlinked (visible with `ls -l`)
  'su=37'       # su = Normal file that is `setuid` (`u+s`)
  'sg=30'       # sg = Normal file that is `setgid` (`g+s`)
  'ca=30'       # ca = File with capability (very expensive to lookup)
  'tw=30'       # tw = Directory that's sticky and other-writable (`+t`,`o+w`)
  'ow=01;33'    # ow = Directory that's other-writable (`o+w`), not sticky
  'st=37'       # st = Directory with sticky bit set (`+t`), not other-writable
  'ex=01;32'    # ex = File which is executable (ie. has `x` set in permissions)
  # HIDDEN OS FILES
  "*._*=$_ls_hide"
  "*.CFUserTextEncoding=$_ls_hide"
  "*.DS_Store=$_ls_hide"
  "*.file=$_ls_hide"
  "*.localized=$_ls_hide"
  # HIDDEN IDE/PROJECT FILES
  "*.c9=$_ls_hush"
  "*.cache=$_ls_hush"
  "*.classpath=$_ls_hush"
  "*.dockerignore=$_ls_hush"
  "*.editorconfig=$_ls_hush"
  "*.env=$_ls_hush"
  "*.eslintrc.json=$_ls_hush"
  "*.git=$_ls_hush"
  "*.gitignore=$_ls_hush"
  "*.grunt=$_ls_hush"
  "*.idea=$_ls_hush"
  "*.jekyll-metadata=$_ls_hush"
  "*.launch=$_ls_hush"
  "*.localrc=$_ls_hush"
  "*.lock-wscript=$_ls_hush"
  "*.lock=$_ls_hush"
  "*.log=$_ls_hush"
  "*.markdownlint.json=$_ls_hush"
  "*.mega-linter.yml=$_ls_hush"
  "*.netrc=$_ls_hush"
  "*.prettierrc=$_ls_hush"
  "*.project=$_ls_hush"
  "*.sass-cache=$_ls_hush"
  "*.settings=$_ls_hush"
  "*.sonar=$_ls_hush"
  "*.sublime-*=$_ls_hush"
  "*.swp=$_ls_hush"
  "*.terraform.lock.hcl=$_ls_hush"
  "*.terraform=$_ls_hush"
  "*.vscode=$_ls_hush"
  "*.webpack.json=$_ls_hush"
  # SHELL / TERMINAL / USER
  "*.account=$_ls_hush"
  "*.anyconnect=$_ls_hush"
  "*.bash_env=$_ls_hush"
  "*.bash_history=$_ls_hush"
  "*.bash_login=$_ls_hush"
  "*.bash_profile=$_ls_hush"
  "*.bash_prompt=$_ls_hush"
  "*.bashrc=$_ls_hush"
  "*.curlrc=$_ls_hush"
  "*.gemrc=$_ls_hush"
  "*.hushlogin=$_ls_hush"
  "*.inputrc=$_ls_hush"
  "*.irbrc=$_ls_hush"
  "*.lesshst=$_ls_hush"
  "*.localrc=$_ls_hush"
  "*.npmrc=$_ls_hush"
  "*.profile=$_ls_hush"
  "*.screenrc=$_ls_hush"
  "*.serverlessrc=$_ls_hush"
  "*.sh_history=$_ls_hush"
  "*.vault=token=$_ls_hush"
  "*.viminfo=$_ls_hush"
  "*.vimrc=$_ls_hush"
  "*.wgetrc=$_ls_hush"
  "*.zcompdump=$_ls_hush"
  "*.zhistory=$_ls_hush"
  "*.zlogin=$_ls_hush"
  "*.zlogout=$_ls_hush"
  "*.zpreztorc=$_ls_hush"
  "*.zprofile=$_ls_hush"
  "*.zsh_history=$_ls_hush"
  "*.zshenv=$_ls_hush"
  "*.zshrc=$_ls_hush"
  # GIT / SOURCE CONTROL
  "*.gitattributes=$_ls_hush"
  "*.gitconfig=$_ls_hush"
  "*.gitflow_export=$_ls_hush"
  "*.gitignore_global=$_ls_hush"
  "*.gitignore=$_ls_hush"
  "*.hgignore_global=$_ls_hush"
  "*.hgignore=$_ls_hush"
  # SPECIAL
  "*_config.yml=01;35"
  "*.Brewfile=01;31"
  "*.code-workspace=01;02;$_ls_special"
  "*.env.example=02;03;$_ls_special"
  "*.env=$_ls_special"
  "*.Gemfile=01;31"
  "*.symlink=02;03;$_ls_special"
  "*Brewfile.lock.json=02;03;31"
  "*Brewfile=01;31"
  "*CODEOWNERS=$_ls_special"
  "*CONTRIBUTING.md=$_ls_special"
  "*docker-compose.yml=01;35"
  "*Dockerfile=01;31"
  "*Gemfile.lock=02;03;31"
  "*Gemfile=01;31"
  "*LICENSE=03"
  "*package-lock.json=02;03;35"
  "*package.json=01;35"
  "*README.md=01;04;$_ls_special"
  # SHELL SCRIPTS (non-executable)
  "*.bash=$_ls_special"
  "*.sh=$_ls_special"
  "*.zsh=$_ls_special"
  # EXECUTABLES / COMPILED SOURCE
  "*.app=$_ls_exec"
  "*.bat=$_ls_exec"
  "*.btm=$_ls_exec"
  "*.class=$_ls_exec"
  "*.cmd=$_ls_exec"
  "*.com=$_ls_exec"
  "*.dll=$_ls_exec"
  "*.exe=$_ls_exec"
  "*.o=$_ls_exec"
  "*.so=$_ls_exec"
  # PACKAGES
  "*.deb=$_ls_special"
  "*.dmg=$_ls_special"
  "*.pkg=$_ls_special"
  "*.rpm=$_ls_special"
  # COMPRESSION
  "*.7z=$_ls_zip"
  "*.arj=$_ls_zip"
  "*.bz=$_ls_zip"
  "*.bz2=$_ls_zip"
  "*.gz=$_ls_zip"
  "*.jar=$_ls_zip"
  "*.lzh=$_ls_zip"
  "*.rar=$_ls_zip"
  "*.t7z=$_ls_zip"
  "*.tar=$_ls_zip"
  "*.taz=$_ls_zip"
  "*.tgz=$_ls_zip"
  "*.Z=$_ls_zip"
  "*.z=$_ls_zip"
  "*.zip=$_ls_zip"
  # CODE
  "*.c=$_ls_code"
  "*.cjs=$_ls_code"
  "*.cjsx=$_ls_code"
  "*.cts=$_ls_code"
  "*.ctsx=$_ls_code"
  "*.java=$_ls_code"
  "*.js=$_ls_code"
  "*.jsx=$_ls_code"
  "*.mjs=$_ls_code"
  "*.mjsx=$_ls_code"
  "*.mts=$_ls_code"
  "*.mtsx=$_ls_code"
  "*.php=$_ls_code"
  "*.py=$_ls_code"
  "*.rb=$_ls_code"
  "*.ts=$_ls_code"
  "*.tsx=$_ls_code"
  # PRO IMAGE
  "*.ai=01;$_ls_image"
  "*.indd=01;$_ls_image"
  "*.psd=01;$_ls_image"
  "*.xcf=01;$_ls_image"
  # IMAGE
  "*.bmp=$_ls_image"
  "*.eps=01;$_ls_image"
  "*.gif=$_ls_image"
  "*.icns=$_ls_image"
  "*.ico=$_ls_image"
  "*.jpeg=$_ls_image"
  "*.jpg=$_ls_image"
  "*.pct=$_ls_image"
  "*.pict=$_ls_image"
  "*.png=$_ls_image"
  "*.sgi=$_ls_image"
  "*.svg=$_ls_image"
  "*.svgz=$_ls_image"
  "*.tga=$_ls_image"
  "*.tif=$_ls_image"
  "*.tiff=$_ls_image"
  "*.webp=$_ls_image"
  # PRO AUDIO
  "*.abl=01;95"
  "*.ablbundle=03;$_ls_audio"
  "*.adg=03;$_ls_audio"
  "*.adv=03;$_ls_audio"
  "*.agr=03;$_ls_audio"
  "*.alc=03;$_ls_audio"
  "*.alp=03;$_ls_audio"
  "*.als=03;$_ls_audio"
  "*.ams=03;$_ls_audio"
  "*.amxd=03;$_ls_audio"
  "*.asd=03;$_ls_audio"
  "*.ask=03;$_ls_audio"
  "*.band=01;95"
  "*.logicx=01;95"
  "*.sd2=$_ls_audio"
  "*.sesx=01;$_ls_video"
  # AUDIO
  "*.aac=$_ls_audio"
  "*.aif=$_ls_audio"
  "*.aifc=$_ls_audio"
  "*.aiff=$_ls_audio"
  "*.alac=$_ls_audio"
  "*.au=$_ls_audio"
  "*.caf=$_ls_audio"
  "*.flac=$_ls_audio"
  "*.flc=$_ls_audio"
  "*.m4a=$_ls_audio"
  "*.m4b=$_ls_audio"
  "*.mid=$_ls_audio"
  "*.midi=$_ls_audio"
  "*.mka=$_ls_audio"
  "*.mp3=$_ls_audio"
  "*.mpc=$_ls_audio"
  "*.ogg=$_ls_audio"
  "*.ra=$_ls_audio"
  "*.smf=$_ls_audio"
  "*.wav=$_ls_audio"
  "*.wave=$_ls_audio"
  # PRO VIDEO
  "*.aep=01;$_ls_video"
  "*.m2t=01;$_ls_video"
  "*.prproj=01;$_ls_video"
  # VIDEO
  "*.avi=$_ls_video"
  "*.flv=$_ls_video"
  "*.m4v=$_ls_video"
  "*.mkv=$_ls_video"
  "*.mov=$_ls_video"
  "*.mp4=$_ls_video"
  "*.mpeg=$_ls_video"
  "*.mpg=$_ls_video"
  "*.qt=$_ls_video"
  "*.wmv=$_ls_video"
)
# typeset -gx zls_colors=("${ls_colors[@]}")

_ogIFS=$IFS
IFS=':'
export LS_COLORS="${ls_colors[*]}:"
IFS=$_ogIFS
