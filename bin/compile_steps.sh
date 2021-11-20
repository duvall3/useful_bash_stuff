#!/bin/bash
# compile_steps.sh -- EWISotT

INFILE=${1:-main.cpp}
BASENAME=$(basename $INFILE .cpp)

gcc $INFILE -E > "$BASENAME".pp
gcc $INFILE -S
gcc $INFILE -c
g++ -o $BASENAME "$BASENAME".o

# all pau!   )
exit 0
