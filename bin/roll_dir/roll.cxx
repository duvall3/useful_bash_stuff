// roll -- simulate and add k rolls of an n-sided die, with overall bonus b
// -- defaults are k = 1, b = 0
// ~ Mark J. Duvall ~ duvall3@github.com ~ 11/2021 ~ //

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

Int_t roll( Int_t k, Int_t n, Int_t b = 0 ) {

// init
Int_t total(0);
TVectorF rolls(k);
Int_t j;

// generate and store appropriate random integers
for ( j=0; j<k; j++ ) {
  rolls[j] = 1 + gRandom->Integer(n-1);
}

// get sum and add bonus
total = rolls.Sum() + b;

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
Int_t roll( Int_t n ) {
  Int_t total = 1 + gRandom->Integer(n-1);
//printf("1d%d  ==>  %d\n", n, total);
  printf("%d\n", total);
  return total;
}

// all pau!   )
