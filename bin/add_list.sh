#!/bin/bash
# add_list -- one-liner to add a single column of numbers

## Copyright (C) 2017 Mark J. Duvall
## 
##     This program is free software: you can redistribute it and/or modify
##     it under the terms of the GNU General Public License as published by
##     the Free Software Foundation, either version 3 of the License, or
##     (at your option) any later version.
## 
##     This program is distributed in the hope that it will be useful,
##     but WITHOUT ANY WARRANTY; without even the implied warranty of
##     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##     GNU General Public License for more details.
## 
##     You should have received a copy of the GNU General Public License
##     along with this program.  If not, see <http://www.gnu.org/licenses/>.


cat $1 | grep -v "^$" | tr "\n" "+" | sed '$ s/.$/\n/' | bc -l
exit 0


# Note: Works on stdin as well as a file.
#    Use grep and/or awk to extract a
#    single column of numbers from a file,
#    then pipe into this script.
