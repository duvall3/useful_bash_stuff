" Vim syntax file
" Language:	C++
" Maintainer:	Mark J. Duvall (mjd) <duvall3.git@gmail.com>
" Adapted from 'unrealcpp.vim' by Ludovic Chabant <https://ludovic.chabant.com>

" Highlight Class and Function names
syn match    cCustomParen    "(" contains=cParen,cCppParen
syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope

hi def link cCustomFunc  Function
hi def link cCustomClass Function
