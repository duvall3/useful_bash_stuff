#!/bin/bash
# make_summary -- simple script to extract and combine summary table and plots from $THESIS_MAIN/main.pdf
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 09/2021 ~ #

#Copyright (C) 2021 Mark J. Duvall / T. Rocks Science
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

# init
STARTPAGE=${1:-69}
ENDPAGE=${2:-74}
INFILE=$THESIS_MAIN/main.pdf
OUTFILE=$THESIS_MAIN/summary_table_and_plots.pdf

# MAIN
echo "Extracting summary..."
cd $THESIS_MAIN
pdfseparate -f $STARTPAGE -l $ENDPAGE $INFILE $THESIS_MAIN/draft_extract-%d.pdf
pdfunite $THESIS_MAIN/draft_extract-*.pdf $OUTFILE 2> /dev/null
echo "Done."

# all pau!   )
exit 0
