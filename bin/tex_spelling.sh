#!/bin/bash
# tex_spelling -- simple script to run aspell on a collection of .tex files
# ~ Mark J. Duvall ~ duvall3.git@gmail.com ~ 12/2022 ~ #

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

# help check
if [[ $1 =~ "-h" ]]; then
  echo "tex_spelling.sh: Runs 'aspell --mode=tex -c' on all .tex files in the current directory."
  exit 10
fi

# aspell check
ASPELL=$(which aspell 2> /dev/null)
if [ ! $ASPELL ]; then
  echo "Error in tex_spelling.sh: Program 'aspell' not found."
  exit 127
fi

# file check
if (! ls $(pwd)/*.tex 2> /dev/null); then
  echo "Error in tex_spelling.sh: No .tex files found in this directory ($(pwd))."
  exit 5
fi

# main
for FILE in $(pwd)/*.tex; do
  $ASPELL --mode=tex -c $FILE
done

# all pau!   )
exit 0
