#!/usr/bin/python3
"Simulate and combine die rolls and bonuses, as in TTRPGs."
# ~ Mark J. Duvall ~ duvall3@github.com ~ 11/2021 ~ #

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

import random

def roll(k, n=None, b=None):
    """Simulate and combine die rolls and bonuses.
    roll(N):
        Show the result of a single roll of an N-sided die.
    roll(K, N):
        Tabulate the results of K rolls of an N-sided die.
    roll(K, N, B):
        Tabulate the results of K rolls of an N-sided die,
        with an overall bonus B.
    Summary:
      |    1dN    =    roll(N)
      |    KdN    =   roll(K, N)
      |  KdN + B  =  roll(K, N, B)
    """

    # arg check
    if n==None:
        if b==None: # plain single roll
            return round( random.uniform(1, k) )
    else:
        if b==None: # no bonus entered
            b = 0

    # init
    request = f'{k}d{n} + {{{b}}}'
    rolls = []

    # generate and store appropriate random integers
    for j in range(k):
        rolls.append( round( random.uniform(1,n) ) )

    # sum (if not yet)
    total = sum(rolls) + b

    # print and return results
    print(request + '  ==>  ', end='')
    for j in range(len(rolls)-1):
        print(f'{rolls[j]} + ', end='')
#   print(f'{rolls[-1]} + {{{b}}}  =  {total}')
    print(f'{rolls[-1]} + {{{b}}}  =  ', end='')
    return total

#end

# all pau!   )
