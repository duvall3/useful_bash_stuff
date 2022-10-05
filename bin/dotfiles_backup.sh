#!/bin/bash
# dotfiles_backup -- back up all ~/.* files (e.g., .bashrc, .bash_aliases, .inputrc, etc.)
# ~ Mark J. Duvall ~ duvall3.git@gmail.com ~ 10/2022 ~ #

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

# init
ORIG_DIR=$(pwd)
DATE=$('date' +%F)
FILENAME=dotfiles_backup_"$DATE".tar.gz

# main
cd ~
TARCMD="tar czf $FILENAME $(find . -maxdepth 1 -name "\.?*" -type f | sed s_^\./__ | sort)"
# echo $TARCMD #debug
eval $TARCMD
EXIT_STATUS=$?

# cleanup
if [ -d ~/archives/dotfiles_backup ]; then
  mv -t ~/archives/dotfiles_backup/ $FILENAME
elif [ -d ~/archives ]; then
  mv -t ~/archives/ $FILENAME
fi

# all pau!   )
cd $ORIG_DIR
exit $EXIT_STATUS
