let s:rollcmd = ""
if has('pythonx')
  pyx import random
  let s:pycmd = "random.randint(1,NUM_SIDES)"
  let s:rollcmd = printf("pyxeval(\"%s\")", s:pycmd)
endif
function SingleRoll(N)
  let SingleRollCmd = substitute(s:rollcmd, "NUM_SIDES", a:N, "g")
  let R = str2nr(eval(SingleRollCmd))
  return R
endfunction
function Roll(K=1,N=0,B=0)
  if a:N==0
    return SingleRoll(a:K)
  endif
  let total = 0
  let rolls = []
  for j in range(a:K)
    let rolls += [SingleRoll(a:N)]
  endfor
  for R in rolls
    let total += R
  endfor
  let total += a:B
  let result = printf("%dd%d + {%d}  ==>  ", a:K, a:N, a:B)
  for R in rolls
    let result .= printf("%d + ", R)
  endfor
  let result .= printf("{%d}  =  %d\n", a:B, total)
  return result
endfunction
