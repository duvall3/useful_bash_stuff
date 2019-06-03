#!/bin/bash
# reminder.sh -- general script to regularly remind the user of things
#   -- this version looks for a to-do list in the user's home directory called "todo"
#         and dispays a graphical checklist
#   -- the checklist source file is plain ASCII with one entry per line (ex., "buy eggs today")
#   -- recommended usage: place an entry in your crontab calling this script every so often,
#         as in this example crontab line, which calls the script every 3 hours at the top of the hour from 0600 to 2100:
#         0 6-21/3 * * *		export DISPLAY=:0; /home/username/bin/reminder.sh
#   -- for now, the user must update the source file manually,
#         but auto-removal of checked items is a planned future feature
#   -- USAGE: reminder.sh [TODO_LIST_FILE]
#      -- default: $HOME/todo


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
if [ $1 ]; then
  LIST_FILE=$1
  else
    LIST_FILE=$HOME/todo
fi

# fetch and format list items
NUM_ITEMS=$(wc -l $LIST_FILE | awk '{print $1}')
for (( ITEM=1; ITEM<=$NUM_ITEMS; ITEM++ )); do
  LIST[$ITEM]=$(awk -v line=$ITEM 'NR ~ line {print $0}' $LIST_FILE | tr " " _)
# LIST[$ITEM]=$(awk -v line=$ITEM 'NR ~ line {print $0}' $LIST_FILE)
# ^ currently, zenity misinterperets spaces as delimiters instead of only newlines;
#   replacing the spaces with underscores is a temporary workaround FIXME
done

## debug
#for (( ITEM=1; ITEM<=$NUM_ITEMS; ITEM++ )); do
#  echo ${LIST[$ITEM]}
#done

# prepare list
LIST_NAME="Todo"
COLUMN="Task"
WIDTH=300
HEIGHT=300

# MAIN
USER_SELECTION=$(zenity --list --checklist --title="Reminder" --width=$WIDTH --height=$HEIGHT\
  --text=$LIST_NAME --column="Selection" --column=$COLUMN \
  $(for (( ITEM=1; ITEM<=$NUM_ITEMS; ITEM++ )); do
     echo "FALSE ${LIST[$ITEM]}"
    done
   )
)

# planned next: TODO
# take $USER_SELECTION and update the $LIST_FILE,
# probably via something like:
# grep -v $USER_SELECTION $HOME/todo > $HOME/temp_todo && mv $HOME/temp_todo $LIST_FILE

# all pau!   )
exit 0
