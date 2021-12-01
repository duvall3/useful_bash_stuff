Int_t roll( Int_t k, Int_t n, Int_t b = 0 ) {
Int_t total(0);
TVectorF rolls(k);
Int_t j;
for ( j=0; j<k; j++ ) {
  rolls[j] = 1 + gRandom->Integer(n-1);
}
total = rolls.Sum() + b;
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
Int_t roll( Int_t n ) {
  Int_t total = 1 + gRandom->Integer(n-1);
  printf("%d\n", total);
  return total;
}
