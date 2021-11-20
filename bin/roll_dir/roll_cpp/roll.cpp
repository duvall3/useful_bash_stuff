// roll -- simulate and add k rolls of an n-sided die, with overall bonus b
// USAGE: roll <SIDES>
//        roll <ROLLS> <SIDES> [BONUS]
// -- Or, in nerd lingo:
//      roll a dN --> 'roll N'
//      roll KdN --> 'roll K N'
//      roll KdN + B --> 'roll K N B'
// Examples:
// -- to roll  d6:         roll 6
// -- to roll 2d6:         roll 2 6
// -- to roll 2d6 + 8:     roll 2 6 8

//Copyright (C) 2021 Mark J. Duvall / T. Rocks Science
//
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/>.


#include <iostream>
#include <string>
#include <vector>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>


using namespace std;


// FUNCTIONS


// primary
int roll( int k, int n, int b = 0 ) {

  // init
  srand( time(NULL) ); // seed
  int total(0);
  vector<int> rolls(k);
  int j;

  // generate and store appropriate random integers
  for ( j=0; j<k; j++ ) {
    rolls[j] = 1 + rand() % n;
  }

  // get sum and add bonus
  for ( j=0; j<k; j++ ) {
    total += rolls[j];
  }
  total += b;

  // print results
  printf("%dd%d + {%d}  ==>  ", k, n, b);
  for ( j=0; j<k; j++ ) {
    printf("%d ", rolls[j]);
    if ( j < k-1 ) {
      printf("+ ");
    } else {
      printf("+ {%d}  =  %d\n", b, total);
    }
  }

  return total;
}

// overload for single roll
int roll( int n )
{
  // init
  int total(0);
  srand( time(NULL) ); // seed
  // roll
  total = 1 + rand() % n;
  // print
  printf("%d\n", total);
  return total;
}


// MAIN
int main( int argc, char *argv[] )
{
  int k, n, b;
//for ( int j=0; j<argc; j++ ) cout << argv[j] << " "; cout << endl; //debug
  switch (argc) {
    case 1:
      printf( "Usage: roll <SIDES>\n       roll <ROLLS> <SIDES> [BONUS]\n" );
      return 2;
      break;
    case 2:
      n = stoi(argv[1]);
      roll(n);
      break;
    case 3:
      k = stoi(argv[1]);
      n = stoi(argv[2]);
      roll( k, n, 0 );
      break;
    case 4:
      k = stoi(argv[1]);
      n = stoi(argv[2]);
      b = stoi(argv[3]);
      roll( k, n, b );
      break;
    default:
      printf( "Usage: roll <SIDES>\n       roll <ROLLS> <SIDES> [BONUS]\n" );
      return 2;
  }
  return 0;
}


// all pau!   )
