#!/bin/bash
# get_steam_app_ids.sh -- Simple script to scan Steam libraries and list app IDs
# USAGE: get_steam_app_ids.sh [-h|OPTS] [LIBRARY_PATH]...
# ~ Mark J. Duvall ~ duvall3.git@gmail.com ~ 10/2023 ~ #

# Copyright (C) 2023 Mark J. Duvall / T. Rocks Science
# 
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
# 
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
# 
#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <http://www.gnu.org/licenses/>.
# 


## INIT

# general
NULL=/dev/null
ERR=/dev/stderr

# control for aliases
ECHO="$(which echo) -e"
REALPATH=$(which realpath)
FIND=$(which find)
SED=$(which sed)
BASENAME=$(which basename)
DIRNAME=$(which dirname)
CAT=$(which cat)
SORT=$(which sort)
UNIQ=$(which uniq)
COL="$(which column) -t"

# define usage
usage() {
  $ECHO "Usage: get_steam_app_ids.sh [-h|OPTS] [LIBRARY_PATH]..."
  $ECHO "Simple script to scan Steam libraries and list app IDs"
  $ECHO
  $ECHO "Options:"
  $ECHO "  -h\tShow this help message and exit"
  $ECHO
}

# process options
while getopts "h" OPTIONS; do
  case $OPTIONS in
    h)
      usage
      exit 10
      ;;
    *)
      $ECHO
      usage
      exit 11
      ;;
  esac
done
# shift $((OPTIND-1)) # uncomment for options with args


## MAIN

# process args, if any
DIR_LIST=${@:-$($REALPATH ~/.steam/steam)}

# loop over libraries
for DIR in $DIR_LIST; do

  # allow for symlinks
  REALDIR=$($REALPATH $DIR)

  # confirm directory
  if [ ! -d  ]; then
    $ECHO "Error: No directory at \"$REALDIR\"."
    exit 3
  fi

  # find and print files, accounting for (*sigh*) spaces in the path names
  FILE_LIST=( $($FIND $DIR -type f -name steam_appid.txt | $SED 's/ /@/g') )
  for FILE in ${FILE_LIST[*]}; do
    FILEPATH=$( $ECHO $FILE | $SED 's/@/\ /g' )
    DIRECTORY=$( $DIRNAME "$FILEPATH" )
    APP=$( $BASENAME "$DIRECTORY" )
    APP=$($ECHO "$APP" | $SED 's/ /_/g')
    $ECHO -en "$APP\t\t"
    $CAT "$FILEPATH"
    $ECHO
  done

done | $SORT | $UNIQ | $COL
EXIT_STATUS=$?


## EXIT

# all pau!   )
EXIT_STATUS=${EXIT_STATUS:-0}
exit $EXIT_STATUS

