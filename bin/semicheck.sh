#!/bin/bash
# semicheck.sh -- script to print out c++ lines that may be missing terminating semicolons

cat $1 |\

  # remove comments
  awk -F "//" '{print $1}' | \
  # remove blank (i.e., empty or whitespace-only) lines
  grep -v "^ *$" | \
  # remove lines ending in semicolons
  grep -v "; *$"

# all pau!   )
exit 0
