" Vim syntax file
" Language:	C++ with Unreal extensions
" Maintainer:	Ludovic Chabant <https://ludovic.chabant.com>
" -- with additions / modifications by Mark J. Duvall (mjd) <duvall3.git@gmail.com>

" mjd commented
" if exists("b:current_syntax")
"   finish
" endif

" mjd commented
" " Read the C++ syntax to start with
" runtime! syntax/cpp.vim
" unlet b:current_syntax

" mjd commented
" Highlight Class and Function names
syn match    cCustomParen    "(" contains=cParen,cCppParen
syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope

hi def link cCustomFunc  Function
hi def link cCustomClass Function


" mjd:
" Add primitive typedefs
syntax keyword unrealTypedef
    \ TCHAR
    \ uint8 int8
    \ uint16 int16
    \ uint32 int32
    \ uint64 int64
    \ PTRINT
hi def link unrealTypedef Typedef

" " Add some base classes
" syntax keyword unrealBaseClass
"     \ FColor
" hi def link unrealBaseClass Typedef
