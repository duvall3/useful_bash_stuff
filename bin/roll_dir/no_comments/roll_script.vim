#!/usr/bin/vim -nNesc:source%
set viminfo=""
set verbose=1
if ( (argc()<2) || (argc()>4) )
  echon "Usage: roll_script.vim <K> <N> [B]\n"
  echon "  or   roll_script.vim <N>\n"
  qall!
endif
let s:k = str2nr(argv(1))
let s:n = str2nr(argv(2))
let s:b = str2nr(argv(3))
if s:n == 0
  let s:n = s:k
  let s:k = 1
endif
let s:rollcmd = ""
if has('pythonx')
  pyx import random
  let s:pycmd = "random.randint(1,NUM_SIDES)"
  let s:rollcmd = printf("pyxeval(\"%s\")", s:pycmd)
endif
if empty(s:rollcmd)
  if ( has('unix') || has('macunix') ) " Linux/Unix/Mac
    let s:shcmd = "echo $((1 + $RANDOM % NUM_SIDES))" " BASH
    let s:rollcmd = printf("system(\"%s\")", s:shcmd)
  elseif ( has('win32') || has('win32unix') ) " Windows
    let s:rollcmd = "1 + str2nr(system('Get-Random')) % NUM_SIDES"
  endif
endif
function! SingleRoll(N)
  let SingleRollCmd = substitute(s:rollcmd, "NUM_SIDES", a:N, "g")
  let R = str2nr(eval(SingleRollCmd))
  return R
endfunction
if s:k==1
  echon printf("%d\n", SingleRoll(s:n))
  qall!
endif
let s:total = 0
let s:rolls = []
for s:j in range(s:k)
  let s:rolls += [SingleRoll(s:n)]
endfor
for s:R in s:rolls
  let s:total += s:R
endfor
let s:total += s:b
let s:result = printf("%dd%d + {%d}  ==>  ", s:k, s:n, s:b)
for s:R in s:rolls
  let s:result .= printf("%d + ", s:R)
endfor
let s:result .= printf("{%d}  =  %d\n", s:b, s:total)
echon s:result
set verbose=0
qall!
