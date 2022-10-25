" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Steven Vertigan <steven@vertigan.wattle.id.au>
" Last Change:	2006 Sep 23
" Revision #5: Switch main text from white to yellow for easier contrast,
" fixed some problems with terminal backgrounds.

" Modified by Mark J. Duvall ~ github.com/duvall3 ~ 10/2022 "

" init
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "blue_mod"

" basic items
hi  Normal        ctermfg=white        
hi  NonText       ctermfg=lightMagenta
hi  comment       ctermfg=cyan          
hi  constant      ctermfg=magenta
hi  identifier    ctermfg=darkGreen
hi  statement     ctermfg=yellow         			cterm=bold
hi  preproc       ctermfg=blue
hi  type          ctermfg=darkCyan      
hi  special       ctermfg=lightGreen
hi  Underlined    ctermfg=blue          			cterm=underline
hi  label         ctermfg=yellow
hi  operator      ctermfg=red      
hi  ErrorMsg      ctermfg=yellow
hi  WarningMsg    ctermfg=darkYellow
hi  ModeMsg       ctermfg=yellow
hi  MoreMsg       ctermfg=yellow

" inverted items
" hi  Error         ctermfg=black		ctermbg=red
hi  Error         ctermfg=red
hi  Todo          ctermfg=black         ctermbg=yellow
hi  Cursor        ctermfg=black         ctermbg=white
hi  Search        ctermfg=black         ctermbg=yellow
hi  IncSearch     ctermfg=black         ctermbg=yellow

" ui items
hi  LineNr        ctermfg=cyan
hi  title         						cterm=bold
hi  StatusLineNC  ctermfg=black         ctermbg=blue
hi  StatusLine    ctermfg=black  	ctermbg=blue
hi  VertSplit     ctermfg=blue          ctermbg=black
" hi  Visual        ctermfg=black  	ctermbg=darkCyan
" hi  Visual        									term=reverse

" vimdiff items
hi  DiffChange    ctermfg=black		ctermbg=darkGreen     
hi  DiffText      ctermfg=black		ctermbg=lightGreen    
hi  DiffAdd       ctermfg=black		ctermbg=blue          
hi  DiffDelete    ctermfg=black		ctermbg=cyan          
hi  Folded        ctermfg=black		ctermbg=yellow        
hi  FoldColumn    ctermfg=black		ctermbg=gray          
hi  cIf0          ctermfg=gray
