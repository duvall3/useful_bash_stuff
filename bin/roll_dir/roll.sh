#!/bin/bash
# roll -- simulate and add k rolls of an n-sided die, with overall bonus b
# -- usage: roll <N> [K] [B]
# -- defaults: K=1, B=0
# ~ Mark J. Duvall ~ duvall3@github.com ~ 11/2021 ~ #

##Copyright (C) 2019 Mark J. Duvall
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
##

# arg check and set
case $# in
  0)
    echo -e "Usage: roll <N> [K] [B]"
    exit 2
    ;;
  1)
    N=$1
    K=1
    ;;
  2|3)
    N=$2
    K=$1
    ;;
  *)
    echo -e "Usage: roll <N> [K] [B]"
    exit 2
    ;;
esac
B=${3:-0}

# initialize
TOTAL=0
ROLLS=()

# generate, store, and sum appropriate random integers
for (( i=0; i<$K; i++ )); do
  ROLLS[$i]=$(( (RANDOM % $N) + 1 ))
  TOTAL=$(( TOTAL + ROLLS[$i] ))
done

# add bonus
TOTAL=$(( TOTAL + B ))

# print results
if [[ $K -gt 1 ]]; then echo "Rolls: ${ROLLS[*]}"; fi
if [[ $B -ne 0 ]]; then echo "Bonus: $B"; fi
echo "TOTAL: $TOTAL"

# all pau!   )
exit 0
