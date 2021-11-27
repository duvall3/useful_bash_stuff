#!/bin/bash
# ueref -- simple script to view the reference page
#   for a specified UnrealEngine4 class
# ~ Mark J. Duvall ~ duvall3@github.com ~ 11/2021 ~ #
#
# USAGE: ueref <UE4class>

##Copyright (C) 2021 Mark J. Duvall
##
##    This program is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License, or
##    (at your option) any later version.
##
##    This program is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with this program.  If not, see <http://www.gnu.org/licenses/>.

# arg check
if [[ ! $1 ]]; then
  echo -e "\nUSAGE: ueref <UE4class>\n"
  exit 10
fi

# init
UNREAL_HOME=${UNREAL_HOME:-$HOME/UnrealEngine}
UNREAL_API_DOC="$UNREAL_HOME"/Engine/Documentation/Builds/CppAPI/en-US/API
CLASSES_FILE=$UNREAL_API_DOC/Classes/index.html
CLASS_NAME=$1
GREP_PATTERN='href=.*<span>'$CLASS_NAME'</span>'

# locate files
CLASS_DIR=$(/usr/bin/grep -Eo $GREP_PATTERN $CLASSES_FILE | /usr/bin/grep -Eo "\".*\"" | /usr/bin/grep -Eo "([[:alnum:]]+/)+")
if [[ ! $CLASS_DIR ]]; then
  echo -e "No index entry for \"$1\" found in $CLASSES_FILE. Exiting.\n"
  exit 3
fi

# open in w3m
TARGET_FILE=$UNREAL_API_DOC/"$CLASS_DIR"index.html
w3m $TARGET_FILE

# all pau!   )
exit 0
