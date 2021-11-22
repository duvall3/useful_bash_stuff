" roll -- same as the others
"' Usage: :source roll.vim, then call as any other function
" ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 11/2021 ~ "

"Copyright (C) 2021 Mark J. Duvall / T. Rocks Science
"
"    This program is free software: you can redistribute it and/or modify
"    it under the terms of the GNU General Public License as published by
"    the Free Software Foundation, either version 3 of the License, or
"    (at your option) any later version.
"
"    This program is distributed in the hope that it will be useful,
"    but WITHOUT ANY WARRANTY; without even the implied warranty of
"    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"    GNU General Public License for more details.
"
"    You should have received a copy of the GNU General Public License
"    along with this program.  If not, see <http://www.gnu.org/licenses/>.

" OS / package check (for RNG)
let s:rollcmd = ""
" Vim's random-number generator is coming in the next version, so for now, try:
" use python:
if has('pythonx')
  pyx import random
  let s:pycmd = "random.randint(1,NUM_SIDES)"
  let s:rollcmd = printf("pyxeval(\"%s\")", s:pycmd)
endif
" or use the shell:
if empty(s:rollcmd)
  if ( has('unix') || has('macunix') ) " Linux/Unix/Mac
    let s:shcmd = "echo $((1 + $RANDOM % NUM_SIDES))" " BASH
    let s:rollcmd = printf("system(\"%s\")", s:shcmd)
  elseif ( has('win32') || has('win32unix') ) " Windows
    " I don't know Windows, but hey, maybe Powershell 
    "   (or whatever) acts exactly like BASH!
    let s:rollcmd = "1 + str2nr(system('Get-Random')) % NUM_SIDES"
  endif
endif

" single-roll function
function SingleRoll(N)
  let SingleRollCmd = substitute(s:rollcmd, "NUM_SIDES", a:N, "g")
  let R = str2nr(eval(SingleRollCmd))
  return R
endfunction

" MAIN
function Roll(K=1,N=0,B=0)

  " simple single roll
  if a:N==0
    return SingleRoll(a:K)
  endif

  " init
  let total = 0

  " roll
  let rolls = []
  for j in range(a:K)
    let rolls += [SingleRoll(a:N)]
  endfor

  " sum
  for R in rolls
    let total += R
  endfor
  let total += a:B

  " print
  let result = printf("%dd%d + {%d}  ==>  ", a:K, a:N, a:B)
  for R in rolls
    let result .= printf("%d + ", R)
  endfor
  let result .= printf("{%d}  =  %d\n", a:B, total)
  return result

  " all pau!   )
endfunction
