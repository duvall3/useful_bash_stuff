#!/usr/bin/python3
import random
def roll(k, n=None, b=None):
    if n==None:
        if b==None: # plain single roll
            return round( random.uniform(1, k) )
    else:
        if b==None: # no bonus entered
            b = 0
    request = f'{k}d{n} + {{{b}}}'
    rolls = []
    for j in range(k):
        rolls.append( round( random.uniform(1,n) ) )
    total = sum(rolls) + b
    print(request + '  ==>  ', end='')
    for j in range(len(rolls)-1):
        print(f'{rolls[j]} + ', end='')
    print(f'{rolls[-1]} + {{{b}}}  =  ', end='')
    return total
