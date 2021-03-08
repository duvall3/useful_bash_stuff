#!/bin/bash
# labels.sh -- generate list of labels from main TEX file
# -- Assumes main .tex file contains ONLY \input commands
#      and that all \chapter, \section, etc.
#      are in the chapter files
# ~ duvall3@github.com ~ 03/2021 ~ #

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

# init
if [ ! $1 ]; then
  echo "USAGE: outline.sh <MAIN_FILE.tex>"
  exit 1
fi
INFILE=$1
INFILE_NAME=$(basename $INFILE .tex)
INFILE_DIR=$(dirname $INFILE)
OUTFILE_DIR=$(pwd)
OUTFILE=$INFILE_NAME"_labels.txt"
#if [ -d $OUTFILE_DIR ]; then
#  echo "$OUTFILE_DIR already exists."
#  exit 2
#else
#  mkdir $OUTFILE_DIR
#fi

# clear previous list
if [ -f $OUTFILE_DIR/$OUTFILE ]; then
  rm $OUTFILE_DIR/$OUTFILE
fi

# process chapters
CHAPTERS=$(grep -e "^\\\input{" $INFILE | sed s/'.input.'// | tr -d })
for FILE in ${CHAPTERS[*]}; do
  awk '$0 !~ /^\ *%/ && $0 ~ /\\label/ {print $0}' $INFILE_DIR/$FILE >> $OUTFILE_DIR/$OUTFILE"_tmp"
done

# format results
cat $OUTFILE_DIR/$OUTFILE"_tmp" | sed s_.*\\\label__ | \
  tr {} @ | \
  awk -F @ '{print $2 "@" $3}' | \
  column -ts @ >> $OUTFILE_DIR/$OUTFILE

# cleanup
rm $OUTFILE_DIR/$OUTFILE"_tmp"

# all pau!   )
exit 0
