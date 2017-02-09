#!/bin/bash
# semicheck.sh -- script to print out c++ lines that may be missing terminating semicolons

cat $1 | \

  awk -F "//" '{print $1}' | \ 	# remove comments
  grep -v "^ *$" | \ 		# remove blank (i.e., empty or whitespace-only) lines
  grep -v "; *$" 		# remove lines ending in semicolons

# all pau!   )
exit 0
