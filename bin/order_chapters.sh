#!/bin/bash
# order_chapters.sh -- create an ordered set of symlinks to chapters in LaTeX project
# -- assumes the following:
#    . project is contained in main PROJECT directory
#    . main project file is called "main.tex"
#    . chapters are located in $PROJECT/chapters
#    . "\input{chapter/*}" lines are in $PROJECT/main.tex

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
if [ ! $1 ]; then
  PROJECT=~/THESIS/MAIN # author's default
else
  PROJECT=$1
fi

# project check
if [ ! -d $PROJECT ]; then
  echo "Project directory not found. Plese make sure you specify the full path (e.g., \"~/mybook\", not just \"mybook\"."
  exit 10
fi

# init
DOCUMENT=$PROJECT/main.tex
CHAPDIR=$PROJECT/chapters
LINKDIR=$CHAPDIR/ordered_chapters
if [ ! -d $LINKDIR ]; then mkdir $LINKDIR; fi

# main
CHAPTER=0
for FILE in $(grep "^\\\input" $DOCUMENT | grep -o "\{.*\}" | tr -d { | tr -d }); do
  CHAPTERNAME=$(basename $FILE)
  CHAPSTRING=$(printf "%02i" $CHAPTER)
  LINKNAME="$CHAPSTRING"_"$CHAPTERNAME"
  ln -s $CHAPDIR/$CHAPTERNAME $LINKDIR/$LINKNAME
  CHAPTER=$((CHAPTER+1))
done

