#!/bin/bash
# generate_outline.sh -- extract the first few pages (i.e., TOC=outline)
#   and the abstract (for now, skipping the lists of figures and tables)
# -- NOTE: requires packages pdftk and pdfgrep
# ~ Mark J. Duvall ~ duvall3@github.com ~ 03/2021 ~ #


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

## DIRECTORY/FILE CONTROL TO BE ADDED
## -- currently just runs in main folder on file 'main.pdf'

END_CONTENTS=$(pdfgrep -ni "[[:lower:]]+\ *CONTENTS|CONTENTS\ *[[:lower:]]+" main.pdf | tail -1 | awk -F : '{print $1}')
ABSTRACT_PAGE=$(pdfgrep -n -m 1 "^Abstract" main.pdf | awk -F : '{print $1}')
pdftk main.pdf cat 1-$END_CONTENTS $ABSTRACT_PAGE output ./outline.pdf

# all pau!   )
exit 0
