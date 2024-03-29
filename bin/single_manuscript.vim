#!/usr/bin/vim -nNesc:source%
" single_manuscript -- convert a LaTeX project into a single .tex file
" -- USAGE (from shell prompt): single_manuscript.vim [OUTFILE]
" -- OUTFILE defaults to 'manuscript.tex'
" -- I'm sure there are more elegant ways to do most or all of this; but it works,
"  	so here it is.
" ~ Mark J. Duvall ~ duvall3.git@gmail.com ~ 07/2023 ~ "
" NOTES
" -- After running this script, use the following to back up and test
" 	your project:
" 		cp main.tex main.tex.orig
" 		cp manuscript.tex main.tex
" 		make clean && make
" 	To restore the original main.tex:
" 		cp main.tex.orig main.tex
" -- This script assumes a project structure similar to the following:
" 	project_main/
" 	├── figures
" 	│   └── figure1.png
" 	│   └── figure2.png
" 	├── main.tex
" 	├── Makefile
" 	├── Refs.bib
" 	└── sections
" 	    ├── section1.tex
" 	    ├── section2.tex
" 	    └── section3.tex


"Copyright (C) 2023 Mark J. Duvall / T. Rocks Science
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

" args
if ( argc()>2 )
  set viminfo=""
  set verbose=1
  echo "Usage: single_manuscript.vim [OUTFILE=manuscript.tex]\n"
  qall!
endif
if ( argc()==2 )
  let s:outfile=argv(1)
else
  let s:outfile="manuscript.tex"
endif

" copy main
let s:mainfile="main.tex"
let s:syscmd = printf('cp %s %s', s:mainfile, s:outfile)
exec system(s:syscmd)

" open outfile
let s:editcmd = printf('e %s', s:outfile)
exec s:editcmd

" loop over uncommented \input(...) commands
let s:N = search("^[^%]*\\\\input{.*\.tex}")
while ( s:N != 0 )
  let s:goN = printf("%dG", s:N)
  norm s:goN
  let s:line = getline(s:N)
  let s:substr = matchstr(s:line, "{.*\.tex}")
  let s:texfile = substitute(s:substr, "[{}]", "", "g")
  norm ddk
  let s:readcmd = printf("r %s", s:texfile)
  exec s:readcmd
  let s:N = search("^[^%]*\\\\input{.*\.tex}")
endwhile

" save
w

" all pau!   )
qall!

