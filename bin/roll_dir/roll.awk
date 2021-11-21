# roll -- simulate and combine N rolls of a K-sided die,
#   with bonus b.

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

# begin block
BEGIN{
  srand()
}

function randint(a)
{
  return int(a * rand())
}

# main block
{

  # arg check
  switch (NF) {
    case 0:
      break
    case 1:
      N = $1
#     print "1d" N "\t" randint(N)
      print 1 + randint(N-1)
      next
    case 2:
      N = $2
      K = $1
      B = 0
      break
    case 3:
      N = $2
      K = $1
      B = $3
      break
    default:
      break
  }

  # init
  total = 0

  # roll
  for ( j=0; j<K; j++ ) {
    rolls[j] = 1 + randint(N-1)
    total += rolls[j]
  }

  # add bonus
  total += B

  # print
  printf "%dd%d + {%d}  ==>  ",K,N,B
  for ( j=0; j<K-1; j++ ) {
    printf "%d + ",rolls[j]
  }
  print rolls[K-1] " + {" B "}  =  " total

}

## end block
#END{
#}

# all pau!   )
