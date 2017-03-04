#!/bin/bash
# reminder.sh -- general script to regularly remind the user of things

##Copyright (C) 2017 Mark J. Duvall
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

# check for zenity
Z_DIR=$(which zenity)
if [ ! $Z_DIR ]; then
  echo "Error: Zenity not found." && exit 1
fi

# set list location
LIST_FILE=$HOME/todo

# fetch and format list items
NUM_ITEMS=$(wc -l $LIST_FILE | awk '{print $1}')
for (( ITEM=1; ITEM<=$NUM_ITEMS; ITEM++ )); do
  LIST[$ITEM]=$(awk -v line=$ITEM 'NR ~ line {print $0}' $LIST_FILE | tr " " _)
# LIST[$ITEM]=$(awk -v line=$ITEM 'NR ~ line {print $0}' $LIST_FILE)
done

## debug
#for (( ITEM=1; ITEM<=$NUM_ITEMS; ITEM++ )); do
#  echo ${LIST[$ITEM]}
#done

# prepare list
LIST_NAME="Todo"
COLUMN="Task"
WIDTH=500
HEIGHT=500

# MAIN
#zenity --list --checklist --title="Reminder" --column=$COLUMN --text=$LIST_NAME $(echo ${LIST[*]})
#zenity --list --title="Reminder" --column=$COLUMN --text=$LIST_NAME $(echo ${LIST[*]})
#zenity --list --title="Reminder" --text=$LIST_NAME --column="Status" --column=$COLUMN --separator=: $(echo ${LIST[*]})
zenity --list --radiolist --title="Reminder" --width=$WIDTH --height=$HEIGHT\
  --text=$LIST_NAME --column="Selection" --column=$COLUMN \
  $(for (( ITEM=1; ITEM<=$NUM_ITEMS; ITEM++ )); do
     echo "FALSE ${LIST[$ITEM]}"
    done
   )

     # awk '{print "FALSE " $0}' $LIST_FILE
# all pau!   )
exit 0
