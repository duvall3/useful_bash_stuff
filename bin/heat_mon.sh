#!/bin/bash
# heat_mon.sh -- script to monitor system temperatures via lm_sensors
# -- runs until terminated via <C-c>
# USAGE: heat_mon.sh [INTERVAL] [NUM_LINES] [COLORIZE]
# -- INTERVAL is assumed to be in seconds; defaults to 5 if not specified
# -- format for INTERVAL is same as "date" command -- e.g., "20m" = "twenty minutes", etc.
# -- NUM_LINES is the number of most-recent lines to print from the log
# -- COLORIZE is a boolean string indicating whether to use color output (default=true)
# ~ Mark J. Duvall ~ duvall3.git@gmail.com ~ 06/2022 ~ Updated 07/2022 ~ #
# v2.1 #

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


## init

# program check
if [[ ! $(type sensors 2> /dev/null) ]]; then
  echo "ERROR: \"sensors\" command not found. Check your installation of the lm_sensors package. Exiting."
  exit 1
fi

# settings
INTERVAL=${1:-5s}
PRINTLINES=${2:-10}
COLORIZE=${3:-true}
HEADING="Thermal Info (°C)"
COLUMN_HEADINGS="WLAN SSD CPU_pkg CPU_cores Fan(RPM) LocalTime"
DEFAULT_THERMFILE=$HOME/useful_bash_stuff/bin/thermal.txt
if [ -d $HOME/useful_bash_stuff ]; then
  THERMFILE=$DEFAULT_THERMFILE
else
  THERMFILE=$HOME/heat_mon.txt
fi
COLUMNS=("temp1" "Composite" "Package" "Core" "fan1")
FIELDS=(2 2 4 3 2)
TEMPS=("--")

# reset function
reset_therm_file () {
  echo $HEADING > $1
  echo $COLUMN_HEADINGS >> $1
  for k in {0..19}; do # because formatting
    echo "-- -- -- -- -- --" >> $1
  done
}

# create if needed
if [ ! -f $THERMFILE ]; then 
  echo "Creating $THERMFILE"
  reset_therm_file $THERMFILE
fi

# awk function
get_temp() { # <infotext> <pattern> <field_no>
  echo $1 | awk -F '%+' -v RS=@ -v pat=$2 -v fld=$3 ' \
    $0 ~ pat {gsub(/\+|\.[[:digit:]]+°C/,"",$fld); print $fld} \
  ' | tr '\n' '_'
}


## MAIN
NUMLINES=$(cat $THERMFILE | 'wc' -l)
while true; do

  # reset if necessary
  if [[ $NUMLINES -gt 200 ]]; then
    echo "Resetting $THERMFILE" #debug
    reset_therm_file $THERMFILE
  fi

  # retrieve and parse sensor data
  TIME=$('date' +%H:%M:%S)
  SENSOR_INFO=$('sensors' -A | tr '\n' '@' | tr ' ' '%')
  # for k in {0..4}; do
  for k in {1..4}; do #debug -- WLAN temp not reporting correctly
    GET_TEMP_RESULT=$(get_temp $SENSOR_INFO ${COLUMNS[k]} ${FIELDS[k]} | sed 's/_$//' | tr '_' ',')
    TEMPS[k]=${GET_TEMP_RESULT:-"--"}
  done

  # write results 
  echo -e "${TEMPS[*]} $TIME" | sed 's/_$//' >> $THERMFILE
  # ((NUMLINES++))
  NUMLINES=$(cat $THERMFILE | 'wc' -l)

  # print results
  echo
  if $COLORIZE; then
    column -t <(cat $THERMFILE | tail --lines=$PRINTLINES | awk '{$3="\033[7m"$3"\033[0m"; print $0}') <(head -2 $THERMFILE | tail -1) # invert colors for CPU_pkg
  else
    column -t <(cat $THERMFILE | tail --lines=$PRINTLINES) <(head -2 $THERMFILE | tail -1) # no color
  fi
  head -n 1 $THERMFILE

  # rest
  sleep $INTERVAL

done


## all pau!   )
exit 0
