#!/bin/bash
# dirsum.sh -- define functions for recursively computing and comparing file hashes
#   USAGE: Source this script in your .bashrc to make the functions available.
# dirsum() -- compute hashes for all files in a directory using SHA or MD5,
#   save the results, and return a single overall hash value
#   USAGE:
#     1) 'cd' into the directory you want to hash
#     2) run 'dirsum'
#     3) 'cd' into the parent directory (i.e., 'cd ..')
#     4) examine the new ".dirsum" text file
#   TO COMPARE HASHES:
#     1) repeat the above procedure
#     2) compare the last lines of the ".dirsum" and ".dirsum~" files
# -- NOTE: MUST BE RUN IN TARGET DIRECTORY
# dirsum_compare() -- automate the hash comparison
#   USAGE: dirsum_compare <FILE1> <FILE2>
#   NOTE: Run in parent directory
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 12/2021 ~ #

#Copyright (C) 2021 Mark J. Duvall / T. Rocks Science
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


# dirsum()
dirsum() {

  # help check
  if [[ $1 =~ -h ]]; then
    echo -e "USAGE:\n1) Navigate to directory to sum."
    echo -e "2) Run 'dirsum'."
    echo -e "3) Go up one directory ('cd ..')."
    echo -e "4) The newest file will contain the hashes."
  fi

  # init
  OUTFILENAME=$(basename $(pwd)).dirsum
  if [ -w ../ ]; then
    OUTFILEDIR="$PWD/.."
  else
    OUTFILEDIR="."
  fi
  OUTFILE=$OUTFILEDIR/$OUTFILENAME
  if [ -f $OUTFILE ]; then OUTFILE="$OUTFILE"~; fi
  TARGETDIR="."
  SORT_LOCALE=C
  if [ $(which shasum) ]; then
    HASHCMD=$(which shasum)
    # HASH_OPTIONS="-U" # Universal newlines: gives same result regardless of Unix Windows line terminators
    HASH_OPTIONS="" # for portability, ironically
  elif [ $(which md5sum) ]; then
    HASHCMD=$(which md5sum)
    HASH_OPTIONS=""
  else
    echo "Error in dirsum: No hash function found."
    exit 1
  fi

  # get and sort file list
  # FILE_LIST=$(find $TARGETDIR -type f | LC_ALL=$SORT_LOCALE sort)
  FILE_LIST=$(find $TARGETDIR -type f -printf "\"%p\"\n"  | LC_ALL=$SORT_LOCALE sort)

  # compute file hashes, then compute hash of result
  #$HASHCMD $HASH_OPTIONS $FILE_LIST | $HASHCMD $HASH_OPTIONS #KEEPME
  $HASHCMD $HASH_OPTIONS $FILE_LIST > $OUTFILE
  echo "###" >> $OUTFILE
  $HASHCMD $HASH_OPTIONS $OUTFILE | tee -a $OUTFILE

  # all pau!   )
  return $?
}


# dirsum_compare()
dirsum_compare() {

  # usage
  usage() {
    echo 'USAGE: dirsum_compare <FILE1> <FILE2>'
    return 10
  }

  # arg check
  if [ $# -lt 2 ]; then usage; fi

  # main
  HASH1=$('tail' -n 1 $1 | 'awk' '{print $1}')
  HASH2=$('tail' -n 1 $2 | 'awk' '{print $1}')
  'diff' -q <('echo' $HASH1) <('echo' $HASH2) 2>&1 > /dev/null
  DIFF=$?
  if [ $DIFF -eq 0 ]; then
    'echo' "Hashes match."
  else
    'echo' "Hashes do not match."
  fi

  # all pau!   )
  return $DIFF
}

