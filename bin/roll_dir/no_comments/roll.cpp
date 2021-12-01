#include <iostream>
#include <string>
#include <vector>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
using namespace std;
int roll( int k, int n, int b = 0 ) {
  srand( time(NULL) ); // seed
  int total(0);
  vector<int> rolls(k);
  int j;
  printf("%dd%d + {%d}  ==>  ", k, n, b);
  for ( j=0; j<k; j++ ) {
    rolls[j] = 1 + rand() % n;
    total += rolls[j];
    printf("%d ", rolls[j]);
    if ( j < k-1 ) {
      printf("+ ");
    } else {
      printf("+ {%d}  =  %d\n", b, total);
    } // end if -- print "+" signs
  } // end rolls loop
  total += b;
  return total;
}
int roll( int n )
{
  int total(0);
  srand( time(NULL) ); // seed
  total = 1 + rand() % n;
  printf("%d\n", total);
  return total;
}
int main( int argc, char *argv[] )
{
  int k, n, b;
  switch (argc) {
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
