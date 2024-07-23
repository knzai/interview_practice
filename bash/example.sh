#!/usr/bin/env bash
set -Eeo pipefail

#============================
# CONSTANTS & DEFAULTS
#============================
#constants
readonly VERSION_NUM='0.1.0'
readonly SCRIPT='example.sh'
#in case terminal doesn't support colors - readonly after setup_colors runs
RESET='' RED='' GREEN='' BLUE='' PURPLE='' CYAN='' YELLOW=''

#environment variables

#defaults
#example=false

#============================
# USAGE & METADATA
#============================
usage() {
   cat <<-EOF
		${CYAN}Name:${RESET} $(script_name) ($VERSION_NUM)
		${CYAN}Description:${RESET}
		${CYAN}Usage:${RESET} 
		${RED}<ENV>${RESET} ./$(script_name) ${YELLOW}[-h, --help] [-v --version] [-e --example ${RED}<arg>${YELLOW}]${RESET}
	EOF

   for i in "$@"; do
      case $i in
      vars) cat <<-EOF
			${CYAN}Environoment variables:${RESET}
			   ${RED}${RESET}                       REQUIRED 
			${CYAN}Arguments:${RESET}
			   ${YELLOW}${RESET}          
			${CYAN}Flags:${RESET}
			   ${YELLOW}[-v, --version] ${RESET}    Output version info. Long form provides more metadata
			   ${YELLOW}[-h, --help]${RESET}        Output help. Long form provides more info, examples
			${CYAN}Options${RESET}
			   ${BLUE}#Describe${RESET}
			   ${YELLOW}[-e --example] ${RED}<arg>${RESET} {'default'}
			EOF
			shift ;;
      eg) cat <<-EOF
			${CYAN}Examples${RESET}
			   ${BLUE}# Standard usage${RESET}
			   ./$(script_name) args
			EOF
			shift ;;
      esac
   done
}

version() { 
	msg "$(script_name) $VERSION_NUM"
   if [ ! $# -eq 0 ]; then
		cat <<-EOF
			${CYAN}Authour & Copyright:${RESET}
			   ${BLUE}version${RESET}     $(script_name) $VERSION_NUM
			   ${BLUE}author${RESET}      Kenzi Connor
			   ${BLUE}copyright${RESET}   Copyright (c) Public Domain
			   ${BLUE}license${RESET}     Public Domain via Unlicense (see footer)
			   ${BLUE}site${RESET}        knz.ai/
			   ${BLUE}source${RESET}      gist.github.com/
			${CYAN}Version history:${RESET}
			   ${BLUE}2024/07/10${RESET} : 0.0.1 : Script creation
		EOF
   fi
}

#============================
# MESSAGING & COLORS
#============================
die() { echo "$*" >&2; exit 2; }
msg() { echo >&2 -e "${1-}"; }

script_name() { echo "${GREEN}$SCRIPT${RESET}"; }

setup_colors() {
   if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
      RESET=$(tput setaf 7) RED=$(tput setaf 1) GREEN=$(tput setaf 2) BLUE=$(tput setaf 4) CYAN=$(tput setaf 6) YELLOW=$(tput setaf 3)
   fi
   readonly RESET RED GREEN BLUE PURPLE CYAN YELLOW
}

#============================
# PARSE PARAMETERS
#============================
parse_params() {
	#change if it can run with no params
   if [ $# -eq 0 ]; then usage && exit; fi;

   #flags and options
   while getopts e:hv-: OPT; do
      # support long options: https://stackoverflow.com/a/28466267/519360
      if [ "$OPT" = "-" ]; then    # long option: reformulate OPT and OPTARG
         OPT="${OPTARG%%=*}"       # extract long option name
         OPTARG="${OPTARG#"$OPT"}" # extract long option argument (may be empty)
         OPTARG="${OPTARG#=}"      # if long option argument, remove assigning `=`
      fi
      case "$OPT" in
         e|example ) example="$OPTARG";;

         h        ) usage 'vars'      ;;
         help     ) usage 'vars' 'eg' ;;
         v        ) version           ;;
         version  ) version 'full'    ;;
         *        )                    exit 2;;
      esac
   done
   shift $((OPTIND-1)) # remove parsed options and args from $@ list

   #positional args
   #var=$1
   return 0
}

#============================
# ALIASES AND FUNCTIONS
#============================

#============================
# MAIN
#============================
main() {
	echo "hello world $example"
}

setup_colors
parse_params "$@"
main


#===============================================================================
# LICENSE: Public Domain via Unlicense
#
# This is free and unencumbered software released into the public domain.
#
# Anyone is free to copy, modify, publish, use, compile, sell, or
# distribute this software, either in source code form or as a compiled
# binary, for any purpose, commercial or non-commercial, and by any
# means.
#
# In jurisdictions that recognize copyright laws, the author or authors
# of this software dedicate any and all copyright interest in the
# software to the public domain. We make this dedication for the benefit
# of the public at large and to the detriment of our heirs and
# successors. We intend this dedication to be an overt act of
# relinquishment in perpetuity of all present and future rights to this
# software under copyright law.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# For more information, please refer to <http://unlicense.org/>