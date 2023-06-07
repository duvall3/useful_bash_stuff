#!/bin/bash
# computing_inventory -- script to query system information and generate a simple database
# Usage: `computing_inventory <COMMAND>`, where COMMAND is either:
#   `entry` to generate an entry for the current machine, or
#   `table` to create or update a table from available existing entries
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


## init

# set headings
HEADINGS="Nickname,Hostname,Location,CPUs,Clock_MHz,Memory_GB,OS_Name,OS_Version,Kernel_Release"

# find executables (to circumvent user aliases, espec. for options)
WHICH=$(which which)
declare -A PROGRAMS=(
  [echo]=$($WHICH echo)
  [awk]=$($WHICH awk)
  [lscpu]=$($WHICH lscpu)
  [free]=$($WHICH free)
  [cat]=$($WHICH cat)
  [uname]=$($WHICH uname)
  [column]=$($WHICH column)
  [tr]=$($WHICH tr)
  [sed]=$($WHICH sed)
  [ls]=$($WHICH ls)
  [mkdir]=$($WHICH mkdir)
)

# adjust for special cases
if [ -z ${PROGRAMS[echo]} ]; then PROGRAMS[echo]=echo; fi
if [ -z ${PROGRAMS[awk]} ]; then PROGRAMS[awk]=$(which gawk); fi
if [ -z ${PROGRAMS[awk]} ]; then PROGRAMS[awk]=$(which mawk); fi

# assign commands
ECHO=${PROGRAMS[echo]}
AWK=${PROGRAMS[awk]}
LSCPU=${PROGRAMS[lscpu]}
FREE=${PROGRAMS[free]}
CAT=${PROGRAMS[cat]}
UNAME=${PROGRAMS[uname]}
COLUMN=${PROGRAMS[column]}
TR=${PROGRAMS[tr]}
SED=${PROGRAMS[sed]}
LS=${PROGRAMS[ls]}
MKDIR=${PROGRAMS[mkdir]}

## define functions

# def program_check
program_check() {
  for KEY in ${!PROGRAMS[*]}; do
    if [ -z ${PROGRAMS[$KEY]} ]; then
      echo "Error in computing_inventory.sh: Program \"$KEY\" not found . Exiting."
      exit 127
    fi
  done
}

# def make_entry
make_entry() {

  # check for programs:
  program_check

  # retrieve and parse data:
  # NICKNAME is optional and manual
  # HOSTNAME is already set
  # LOCATION is optional and manual
  # nCPUs=$( printf "%03d" $($LSCPU | $AWK -F : '$1 ~ /^CPU\(s\)/ {print $2}') )
  nCPUs=$( printf "%03d" $($LSCPU | $AWK -F : '$0 ~ /^CPU\(s\):\s+[[:digit:]]+$/ {print $2}') )
  CLOCK_MHz=$($LSCPU | $AWK -F : '$1 ~ /^CPU MHz/ {print int($2)}')
  MEMORY_GB=$( printf "%03d" $($FREE -g | $AWK 'NR==2 {print $2}') )
  if [ -r /etc/os-release ]; then
    OS_NAME=$($CAT /etc/os-release | $AWK -F = '$1 ~ /^NAME/ {print $2}' | $TR ' ' '_' | $TR -d \")
    OS_VERSION=$($CAT /etc/os-release | $AWK -F = '$1 ~ /^VERSION_ID/ {print $2}' | $TR ' ' '_' | $TR -d \")
  fi
  KERNEL_RELEASE=$($UNAME -r)

  # fill data array:
  #   copy successful queries into data array,
  #   and print placeholder text for unsuccessful queries
  declare -a DATA
  DATA[0]="NICKNAME"
  DATA[1]=${HOSTNAME:-"HOSTNAME"}
  DATA[2]="LOCATION"
  DATA[3]=${nCPUs:-"nCPUs"}
  DATA[4]=${CLOCK_MHz:-"CLOCK_MHz"}
  DATA[5]=${MEMORY_GB:-"MEMORY_GB"}
  DATA[6]=${OS_NAME:-"OS_NAME"}
  DATA[7]=${OS_VERSION:-"OS_VERSION"}
  DATA[8]=${KERNEL_RELEASE:-"KERNEL_RELEASE"}

  # write to output file
  $MKDIR -p entries
  OUTFILE=entries/"$HOSTNAME".csv
  $ECHO ${DATA[*]} | $TR ' ' ',' | $SED 's/,$//' > $OUTFILE

}


# def make_table
make_table() {

  # check for programs:
  program_check

  # init
  BASENAME=computing_inventory
  OUTCSV="$BASENAME".csv
  OUTTXT="$BASENAME".txt
  ENTRIES_DIR=entries

  # write headings to output file
  $ECHO $HEADINGS > $OUTCSV

  # append entry files to output file, beginning with the vibegroove3-EXAMPLE and mtc-b (if present)
  declare -a FILELIST=()
  FILELIST[0]=$($LS $ENTRIES_DIR/*.csv | $AWK '$0 ~ /vibegroove3/')
  FILELIST[1]=$($LS $ENTRIES_DIR/*.csv | $AWK '$0 ~ /mtc-b/')
  FILELIST[2]=$($LS $ENTRIES_DIR/*.csv | $AWK '$0 !~ /vibegroove3|mtc-b/')
  cat ${FILELIST[*]} >> $OUTCSV

  # format and write ASCII table
  $COLUMN -ts , $OUTCSV > $OUTTXT

}


## MAIN
USAGE='Usage: computing_inventory <entry|table> -- `entry` to generate an entry, or `table` to combine existing entries'
if [ $# -eq 0 ]; then
  $ECHO $USAGE
  exit 10
fi
case $1 in
  -h|--help)
    $ECHO $USAGE
    exit 10
    ;;
  entry)
    if [ -z $HOSTNAME ]; then $ECHO "Enter a hostname for this machine: " && read HOSTNAME; fi
    make_entry
    ;;
  table)
    make_table
    ;;
  *)
    $ECHO 'computing_inventory.sh: Invalid command; run `computing_inventory.sh --help` for usage.'
    exit 3
    ;;
esac


## all pau!   )
exit 0
