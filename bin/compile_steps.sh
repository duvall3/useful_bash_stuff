#!/bin/bash
# compile_steps.sh -- Script to demonstrate the individual stages
#   of making a simple c++ program:
#   Preprocess --> Compile --> Assemble --> Link
# Usage: compile_steps.sh [-h|-c] [SOURCE_FILE] [TARGET]"
# -- Written and tested on 64-bit Ubuntu 20.04.5 using gcc/g++ 9.4.0
# -- Examples: 'compile_steps.sh main.cpp myprogram'; 'compile_steps.sh -c'
# ~ Mark J. Duvall ~ duvall3.git@gmail.com ~ 11/2022 ~ #

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

# define usage
usage() {
  echo "Usage: compile_steps.sh [-h|-c] [SOURCE_FILE] [TARGET]"
  echo "Build TARGET in stages from SOURCE_FILE."
  echo
  echo "If called with only one argument, TARGET defaults to the basename of SOURCE_FILE."
  echo "If called without arguments, SOURCE_FILE defaults to 'main.cpp'."
  echo
  echo "Options:"
  echo -e "  -h\tShow this help message and exit"
  echo -e "  -c\tClean built files (requires SOURCE_FILE and TARGET if different from default)"
}

# process options
CLEAN_TF=false
while getopts "hc" OPTIONS; do
  case $OPTIONS in
    h)
      usage
      exit 0
      ;;
    c)
      CLEAN_TF=true
      shift
      ;;
  esac
done

# determine source file
if [ $# -gt 0 ]; then			# if SOURCE_FILE provided on command line
  SOURCE_FILE=$1			#   then use it
else					# if no args
  SRC_FILES=(*.cpp)			#   then get list of .cpp files in current directory
  if [ ${#SRC_FILES[*]} -eq 1 ]; then	#   if found exactly 1 .cpp file
    SOURCE_FILE=${SRC_FILES[0]}		#     then use it
  else					#   if found 0 or multiple .cpp files
    SOURCE_FILE=main.cpp		#     then guess 'main.cpp'
  fi
fi

# init
BASENAME=$(basename $SOURCE_FILE .cpp)
PREP_FILE="$BASENAME".ii
ASM_FILE="$BASENAME".s
OBJ_FILE="$BASENAME".o
TARGET=${2:-$BASENAME}

# clean
if $CLEAN_TF; then
  echo -e "  /usr/bin/rm ./$BASENAME.{ii,s,o}\n  /usr/bin/rm ./$TARGET"
  for FILE in {$BASENAME.{ii,s,o},$TARGET}; do
    if [ -e ./$FILE ]; then /usr/bin/rm ./$FILE; fi
  done
  exit $?
fi

# confirm source file is present
if [ ! -e ./$SOURCE_FILE ]; then
  echo -e "Error: $(basename $0) could not find source file ./$SOURCE_FILE; run '$(basename $0) -h' for help"
  exit 5
fi

# set any desired options, flags, etc.
GCC="$(which gcc) -Wall"
GPP="$(which g++)"

# main:
echo "Building target '$TARGET' from source '${SOURCE_FILE}'..."
# preprocess only: original source code --> preprocessed source code
PREP="$GCC $SOURCE_FILE -E -o $PREP_FILE"
echo -e "  Preprocessing:\t$PREP"
eval $PREP
# compile only: preprocessed source code --> assembler code
COMP="$GCC $PREP_FILE -S"
echo -e "  Compiling:\t\t$COMP"
eval $COMP
# assemble only: assembler code --> object file
ASSM="$GCC $ASM_FILE -c"
echo -e "  Assembling:\t\t$ASSM"
eval $ASSM
# link: object file (plus any libs) --> binary executable
LINK="$GPP -o $TARGET $OBJ_FILE"
echo -e "  Linking:\t\t$LINK"
eval $LINK
if [ $? -eq 0 ]; then echo "Done."; fi

# all pau!   )
exit 0
