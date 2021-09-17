#!/bin/bash
# list_chapters.sh -- extract just the chapter listings from the TOC


##Copyright (C) 2021 Mark J. Duvall
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


if [ ! $1 ]; then
  DOCUMENT=../main.pdf
else
  DOCUMENT=$1
fi

PAGES=$(pdfgrep -in CONTENTS $DOCUMENT | awk -F : '{print $1}' | tr ' ' ',')
PAGE_RANGE=$(echo $PAGES | tr " " ",")

pdfgrep --page-range=$PAGE_RANGE "[[:digit:]]+\ +[[:alpha:]]+" $DOCUMENT | awk '$0 !~ "\\." {$NF=""; print $0}'

# all pau!   )
exit 0
