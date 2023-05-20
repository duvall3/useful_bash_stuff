#!/bin/bash
# install_newhome.sh -- simple script to install the user-config files
#   (.*rc, etc) from this directory into the $USER's $HOME directory
# USAGE: ./install_newhome.sh [-f]
# -- Run with option '-f' to force overwriting of destination files
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2022 ~ #

#Copyright (C) 2022 Mark J. Duvall / T. Rocks Science
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

# dir check
if [[ ! $(pwd) =~ useful_bash_stuff/newhome ]]; then
  echo "Please run this script from the 'useful_bash_stuff/newhome' directory."
  echo "USAGE: ./install_newhome.sh [-f]"
  exit 5
fi

# arg check
if [ $1 ]; then
  if [[ $1 =~ -f ]]; then
    OPTION="-f"
  else
    echo "USAGE: ./install_newhome.sh [-f]"
    exit 10
  fi
fi

# main
for FILE in {bashrc,bash_aliases,inputrc,screenrc,vim/,vimrc}; do
  cp -ir $OPTION $FILE $HOME/.$FILE
done

# all pau!   )
exit 0
