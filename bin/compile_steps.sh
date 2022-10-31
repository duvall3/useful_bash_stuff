#!/bin/bash
# compile_steps.sh -- compile and link a simple C++ program step-by-step
# USAGE: compile_steps.sh [FILENAME]
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
INFILE=${1:-main.cpp}
BASENAME=$(basename $INFILE .cpp)

# main:
# preprocess only: original source code --> preprocessed source code
PREP="gcc $INFILE -E > \"$BASENAME\".pp"
echo "Preprocessing: $PREP"
eval $PREP
# compile only: preprocessed source code --> assembler code
COMP="gcc $INFILE -S"
echo "Compiling: $COMP"
eval $COMP
# assemble only: assembler code --> object file
ASSM="gcc $INFILE -c"
echo "Assembling: $ASSM"
eval $ASSM
# link: object file (plus any libs) --> binary executable
LINK="g++ -o $BASENAME \"$BASENAME\".o"
echo "Linking: $LINK"
eval $LINK

# all pau!   )
exit $?
