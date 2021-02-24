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
INFILE_NAME=$(basename $INFILE .tex)
INFILE_DIR=$(dirname $INFILE)
OUTFILE_DIR="outline_"$INFILE_NAME
OUTFILE=$OUTFILE_DIR".tex"
if [ -d $OUTFILE_DIR ]; then
  echo "$OUTFILE_DIR already exists."
  exit 2
else
  mkdir $OUTFILE_DIR
fi

# Makefile
echo -e "\
# usage: make clean
#	 make
PROJECT=$(basename $OUTFILE .tex)
SOURCES=\$(*.tex)
TEX=pdflatex
#BIBTEX=bibtex
BUILDTEX=\$(TEX) \$(PROJECT).tex

all: \$(PROJECT).pdf

\$(PROJECT).pdf: \$(SOURCES)
#all:
	\$(BUILDTEX)
#	\$(BIBTEX) \$(PROJECT)
	\$(BUILDTEX)
	\$(BUILDTEX)

clean:
	rm -f *.ps *.dvi *.aux *.log p.ps *backup *~ *.bbl *blg *.pdf *.toc
" >> $OUTFILE_DIR/Makefile

# LaTeX header
echo -e "\
\documentclass[a4paper,11pt]{book}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{authblk}\n
\usepackage{graphicx,hyperref} \hypersetup{colorlinks=true, linkcolor=blue, urlcolor=blue, citecolor=blue}
\\\begin{document}
" > $OUTFILE_DIR/$OUTFILE

# title, author, etc.
awk '$0 ~ /^\\(title|author|affil|date|maketitle)/ {print $0}' $INFILE >> $OUTFILE_DIR/$OUTFILE

# ACTUAL OUTLINE = TOC
echo -e "\n\\\tableofcontents\n" >> $OUTFILE_DIR/$OUTFILE

# process chapters
CHAPTERS=$(grep -e "^\\\input{" $INFILE | sed s/'.input.'// | tr -d })
for FILE in ${CHAPTERS[*]}; do
  awk '$0 ~ /^\\(chapter|.*section)/ {print $0}' $INFILE_DIR/$FILE >> $OUTFILE_DIR/$OUTFILE
# echo $FILE >> $OUTFILE_DIR/$OUTFILE #debug
done

# finish up
echo -e "\n\\\end{document}" >> $OUTFILE_DIR/$OUTFILE

# all pau!   )
exit 0
