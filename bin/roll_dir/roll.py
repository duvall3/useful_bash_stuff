#!/usr/bin/python3
"Simulate and combine die rolls and bonuses, as in TTRPGs."

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
