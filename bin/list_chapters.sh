#!/bin/bash
# list_chapters.sh -- extract just the chapter listings from the TOC

if [ ! $1 ]; then
# echo "USAGE: list_chapters.sh <FILENAME>"
# exit 2
  DOCUMENT=../main.pdf
else
  DOCUMENT=$1
fi

PAGES=$(pdfgrep -n CONTENTS $DOCUMENT | awk -F : '{print $1}' | tr ' ' ',')
PAGE_RANGE=$(echo $PAGES | tr " " ",")

pdfgrep --page-range=3,4,5 "[[:digit:]]+\ +[[:alpha:]]+" $DOCUMENT | awk '$0 !~ "\." {$NF=""; print $0}'

# all pau!   )
exit 0
