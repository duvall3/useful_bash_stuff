"""
Startup / profile script for Python
"""

# modules
import os
import sys
import re
import numpy as np
import pprint
from inspect import getmembers, signature

# aliases
pwd = os.getcwd()
ls = os.listdir
cd = os.chdir

# constants
PI: float = 3.14159265358979323846

# functions
# exist -- whether identifier exists
def exist( name: str=str() ) -> bool:
    """ Report whether variable named 'name' exists. """
    if name == str():
        print(r'Please enter a variable name.')
        return None
    return ( name in locals() or name in globals() )
# pp -- pretty print
def pp( identifier = None ):
    """ Shortcut/alias for pprint.pp(identifier)."""
    pprint.pp( vars(identifier) )
    return None
# listre -- regex-search a list
def listre( listname: list, restring: str ) -> list:
    """ Search a list for items matching a regex. """
    pat = re.compile(restring)
    matches = list( filter(pat.match, listname) )
    return matches

# all pau!   )

