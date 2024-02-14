#!/bin/bash
# catcodecolor -- moderately-silly script to steadily print a syntax-highlighted
#   source/code file to stdout
# USAGE: catcodecolor <FILE> <LEXER>
# -- where "LEXER" is a language specifier -- e.g., cpp, html, [ba]sh, py[thon], etc.
# -- ex.: catcodecolor example.sh sh

if [ $# -eq 0 ]; then
  echo "Usage: catcodecolor <FILE> <LEXER>"
  exit 2
fi

FILE_LINES=$(wc -l $1 | awk '{print $1}')
for (( LINE_NO = 1; LINE_NO < $FILE_LINES; LINE_NO++ )) {
  awk -v lineNo=$LINE_NO 'NR == lineNo {print}' $1 | pygmentize -s -O style=lovelace -l $2
sleep .10s
}

# all pau!   )
exit 0
