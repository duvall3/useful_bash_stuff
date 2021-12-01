BEGIN{
  srand()
}
function randint(a)
{
  return int(a * rand())
}
{
  switch (NF) {
    case 0:
      break
    case 1:
      N = $1
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
  total = 0
  for ( j=0; j<K; j++ ) {
    rolls[j] = 1 + randint(N-1)
    total += rolls[j]
  }
  total += B
  printf "%dd%d + {%d}  ==>  ",K,N,B
  for ( j=0; j<K-1; j++ ) {
    printf "%d + ",rolls[j]
  }
  print rolls[K-1] " + {" B "}  =  " total
}
