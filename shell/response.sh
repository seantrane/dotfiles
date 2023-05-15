#!/usr/bin/env bash
#
# Shell Response Text/Colors/Helpers
#
# This file contains text/color effects and
# text-response helper functions for Shell scripts.
#
# shellcheck disable=SC1090,SC1091

# Color Switch
export SWITCH='\033['

# Clear whole line and hard-line-return
export ClearLine="${SWITCH}2K"
export ClearLineReturn="${ClearLine}\r"
export ClearNewLine="${ClearLineReturn}\n"

# Text Attributes
export Reset="${SWITCH}0m"
export Bold="${SWITCH}1m"
export Dim="${SWITCH}2m"
export Underline="${SWITCH}4m"
export Blink="${SWITCH}5m"
export Reverse="${SWITCH}7m"
export Hidden="${SWITCH}8m"

# Regular Colors
export Black="${SWITCH}0;30m"
export Red="${SWITCH}0;31m"
export Green="${SWITCH}0;32m"
export Yellow="${SWITCH}0;33m"
export Blue="${SWITCH}0;34m"
export Magenta="${SWITCH}0;35m"
export Cyan="${SWITCH}0;36m"
export White="${SWITCH}0;37m"
export Default="${SWITCH}0;39m"

# Bold
export BBlack="${SWITCH}1;30m"
export BRed="${SWITCH}1;31m"
export BGreen="${SWITCH}1;32m"
export BYellow="${SWITCH}1;33m"
export BBlue="${SWITCH}1;34m"
export BMagenta="${SWITCH}1;35m"
export BCyan="${SWITCH}1;36m"
export BWhite="${SWITCH}1;37m"
export BDefault="${SWITCH}1;39m"

# Underline
export UBlack="${SWITCH}4;30m"
export URed="${SWITCH}4;31m"
export UGreen="${SWITCH}4;32m"
export UYellow="${SWITCH}4;33m"
export UBlue="${SWITCH}4;34m"
export UMagenta="${SWITCH}4;35m"
export UCyan="${SWITCH}4;36m"
export UWhite="${SWITCH}4;37m"
export UDefault="${SWITCH}4;39m"

# Background
export BGBlack="${SWITCH}40m"
export BGRed="${SWITCH}41m"
export BGGreen="${SWITCH}42m"
export BGYellow="${SWITCH}43m"
export BGBlue="${SWITCH}44m"
export BGMagenta="${SWITCH}45m"
export BGCyan="${SWITCH}46m"
export BGWhite="${SWITCH}47m"
export BGDefault="${SWITCH}49m"

# High Intensity
export IBlack="${SWITCH}0;90m"
export IRed="${SWITCH}0;91m"
export IGreen="${SWITCH}0;92m"
export IYellow="${SWITCH}0;93m"
export IBlue="${SWITCH}0;94m"
export IMagenta="${SWITCH}0;95m"
export ICyan="${SWITCH}0;96m"
export IWhite="${SWITCH}0;97m"
export IDefault="${SWITCH}0;99m"

# Bold High Intensity
export BIBlack="${SWITCH}1;90m"
export BIRed="${SWITCH}1;91m"
export BIGreen="${SWITCH}1;92m"
export BIYellow="${SWITCH}1;93m"
export BIBlue="${SWITCH}1;94m"
export BIMagenta="${SWITCH}1;95m"
export BICyan="${SWITCH}1;96m"
export BIWhite="${SWITCH}1;97m"
export BIDefault="${SWITCH}1;99m"

# High Intensity backgrounds
export BGIBlack="${SWITCH}0;100m"
export BGIRed="${SWITCH}0;101m"
export BGIGreen="${SWITCH}0;102m"
export BGIYellow="${SWITCH}0;103m"
export BGIBlue="${SWITCH}0;104m"
export BGIMagenta="${SWITCH}0;105m"
export BGICyan="${SWITCH}0;106m"
export BGIWhite="${SWITCH}0;107m"
export BGIDefault="${SWITCH}0;109m"

#-----------------------------------------------------------------------
# Shell Response Helpers
#-----------------------------------------------------------------------

# ! type "sh_text" &> /dev/null && . "$DOTFILES/functions/sh_text"
# ! type "sh_user" &> /dev/null && . "$DOTFILES/functions/sh_user"
# ! type "sh_yesno" &> /dev/null && . "$DOTFILES/functions/sh_yesno"
# ! type "sh_alert" &> /dev/null && . "$DOTFILES/functions/sh_alert"
# ! type "sh_info" &> /dev/null && . "$DOTFILES/functions/sh_info"
# ! type "sh_note" &> /dev/null && . "$DOTFILES/functions/sh_note"
# ! type "sh_error" &> /dev/null && . "$DOTFILES/functions/sh_error"
# ! type "sh_success" &> /dev/null && . "$DOTFILES/functions/sh_success"
# ! type "sh_fail" &> /dev/null && . "$DOTFILES/functions/sh_fail"

. "$DOTFILES/functions/sh_text"
. "$DOTFILES/functions/sh_user"
. "$DOTFILES/functions/sh_yesno"
. "$DOTFILES/functions/sh_alert"
. "$DOTFILES/functions/sh_info"
. "$DOTFILES/functions/sh_note"
. "$DOTFILES/functions/sh_error"
. "$DOTFILES/functions/sh_success"
. "$DOTFILES/functions/sh_fail"
