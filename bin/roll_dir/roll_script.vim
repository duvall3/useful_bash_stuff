#!/usr/bin/vim -nNesc:source%
" roll_script -- same as the others
"' Usage: roll.vim 000000000000000000
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

" vim settings
set viminfo=""
set verbose=1

" args
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
    "   (or however it's spelled) acts exactly like BASH!
    let s:rollcmd = "1 + str2nr(system('Get-Random')) % NUM_SIDES"
  endif
endif

" internal single-roll function
function! SingleRoll(N)
  let SingleRollCmd = substitute(s:rollcmd, "NUM_SIDES", a:N, "g")
  let R = str2nr(eval(SingleRollCmd))
  return R
endfunction

" single roll
if s:k==1
  echon printf("%d\n", SingleRoll(s:n))
  qall!
endif

" init
let s:total = 0

" roll
let s:rolls = []
for s:j in range(s:k)
  let s:rolls += [SingleRoll(s:n)]
endfor

" sum
for s:R in s:rolls
  let s:total += s:R
endfor
let s:total += s:b

" print
let s:result = printf("%dd%d + {%d}  ==>  ", s:k, s:n, s:b)
for s:R in s:rolls
  let s:result .= printf("%d + ", s:R)
endfor
let s:result .= printf("{%d}  =  %d\n", s:b, s:total)
echon s:result

" all pau!   )
set verbose=0
qall!

