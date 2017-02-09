#!/bin/bash
# semicheck.sh -- script to print out c++ lines that may be missing terminating semicolons
# ~ duvall3@github.com ~ 2/2017 ~ #

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

cat $1 |\

  # remove comments
  awk -F "//" '{print $1}' | \
  # remove directives
  grep -Ev "^#" | \
  # remove blank lines (i.e., empty or whitespace-only)
  grep -Ev "^ *$" | \
  # remove lines ending in semicolons
  grep -Ev "; *$" | \
  # remove lines containing only braces
  grep -Ev "^ *\{ *$" | \
  grep -Ev "^ *\} *$" | \
  # remove lines ending in an open brace
  grep -Ev "\{ *$"

# all pau!   )
exit 0
