# type.sh -- script to suppress printing of functions from type builtin
# Recommendation: For convenience, place the following line
#   in one of your .bashrc / .bash_aliases / .profile, etc.:
#     alias type='. type.sh'
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 02/2024 ~ #

#Copyright (C) 2024 Mark J. Duvall / T. Rocks Science
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

# main
for ARG in $@; do
  RESULT=$('type' -t $ARG 2> /dev/null)
  RESULT=${RESULT:-none}
  if [ $RESULT = function ]; then
    echo "$ARG is a function"
  else
    'type' $ARG
  fi
done

# all pau!   )
return $?

