#!/bin/bash
# outline.sh -- generate outline from main.tex
# -- Assumes main .tex file contains ONLY \input commands
#      and that all \chapter, \section, etc.
#      are in the chapter files
# mjduvall@hawaii.edu

# init
if [ ! $1 ]; then
  echo "USAGE: outline.sh <MAIN_FILE.tex>"
  exit 1
fi
INFILE=$1
OUTFILE=$(basename $INFILE .tex)"_outline.tex"
if [ -f $OUTFILE ]; then
  echo "$OUTFILE already exists."
  exit 2
fi

# LaTeX header
echo -e "\
\documentclass[a4paper,11pt]{book}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{authblk}\n
\\\begin{document}
" > $OUTFILE

# title, author, etc.
awk '$0 ~ /^\\(title|author|affil|date|maketitle)/ {print $0}' $INFILE >> $OUTFILE

# ACTUAL OUTLINE = TOC
echo -e "\n\\\tableofcontents\n" >> $OUTFILE

# process chapters
CHAPTERS=$(grep -e "^\\\input{" $INFILE | sed s/'.input.'// | tr -d })
for FILE in ${CHAPTERS[*]}; do
  awk '$0 ~ /^\\(chapter|.*section)/ {print $0}' ../$FILE >> $OUTFILE
done

# finish up
echo -e "\n\\\end{document}" >> $OUTFILE

# all pau!   )
exit 0
