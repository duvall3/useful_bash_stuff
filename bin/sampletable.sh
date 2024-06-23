#!/bin/bash
# sampletable.sh -- Generate an extremely simple data table
# USAGE: sampletable.sh [-h|-f] [OUTFILENAME]
# Default OUTFILENAME is "sample.dat"
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 06/2024 ~ #

## INIT

# general
NULL=/dev/null
ERR=/dev/stderr

# aliases
ECHO="$(which echo) -e"
SEQ=$(which seq)
COLT="$(which column) -tR 0"

# define usage
usage() {
  $ECHO "Usage: sampletable.sh [-h|-f] [OUTFILENAME]"
  $ECHO "  Generate an extremely simple data table."
  $ECHO "  Default OUTFILENAME is 'sample.dat'."
  $ECHO
  $ECHO "Options:"
  $ECHO "  -h\tShow this help message and exit"
  $ECHO "  -f\tForce overwrite of existing output file"
  $ECHO
}

# process options and args
OVERWRITE=false
while getopts "hf" OPTIONS; do
  case $OPTIONS in
    h)
      usage
      exit 10
      ;;
    f)
      OVERWRITE=true
      shift
      ;;
    *)
      $ECHO
      usage
      exit 11
      ;;
  esac
done
# shift $((OPTIND-1)) # uncomment for options with args
OUTFILENAME=${1:-"sample.dat"}


## MAIN

# build simple data string
DATA=""
for COLNAME in {A..C}; do DATA+="$COLNAME "; done
DATA+="\n"
for ((K=0; K<3; K++)) {
  X=$((3*K+1))
  NUM=$($SEQ -s ' ' $X $((X+2)))
  DATA+="$NUM\n"
}

##debug
#$ECHO $DATA

# write output
if [ -e $OUTFILENAME ] && ! $OVERWRITE; then
  $ECHO "Error: Use '-f' to overwrite an existing file." > $ERR
else
  $ECHO ${DATA%"\n"} | $COLT > $OUTFILENAME
fi
EXIT_STATUS=$?


## EXIT

# all pau!   )
EXIT_STATUS=${EXIT_STATUS:-0}
exit $EXIT_STATUS

