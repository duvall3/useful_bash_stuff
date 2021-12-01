#!/bin/bash
case $# in
  0)
    echo -e "Usage: roll <K> <N> [B]\n  or   roll <N>"
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
    echo -e "Usage: roll <K> <N> [B]\n  or   roll <N>"
    exit 2
    ;;
esac
B=${3:-0}
TOTAL=0
ROLLS=()
for (( i=0; i<$K; i++ )); do
  ROLLS[$i]=$(( (RANDOM % $N) + 1 ))
  TOTAL=$(( TOTAL + ROLLS[$i] ))
done
TOTAL=$(( TOTAL + B ))
if [ $K -lt 2 ]; then echo $TOTAL; exit 0; fi
printf "%dd%d + {%d}  ==>  " $K $N $B
for R in ${ROLLS[*]}; do
  printf "%d + " $R
done
printf "{%d}  =  %d\n" $B $TOTAL
exit 0
