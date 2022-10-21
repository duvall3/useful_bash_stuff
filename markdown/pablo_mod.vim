" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Ron Aaron <ron@ronware.org>
" Last Change:	2003 May 02

" Modified by Mark J. Duvall ~ github.com/duvall3 ~ 10/2020 "

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "pablo_mod"

highlight Comment	 ctermfg=Cyan						  guifg=#808080
highlight Constant	 ctermfg=DarkYellow			   cterm=bold guifg=#00ffff				  gui=none
highlight Identifier ctermfg=Green						  guifg=#00c0c0
highlight Statement  ctermfg=Yellow			   cterm=bold guifg=#c0c000				  gui=bold
highlight PreProc	 ctermfg=Blue						  guifg=#00ff00
highlight Type		 ctermfg=DarkCyan						  guifg=#00c000
highlight Special	 ctermfg=LightGreen						  guifg=#0000ff
highlight Error					ctermbg=Red							guibg=#ff0000
highlight Todo		 ctermfg=Black	ctermbg=Cyan			  guifg=#000080 guibg=#c0c000
highlight Directory  ctermfg=Gray						  guifg=#00c000
highlight StatusLine ctermfg=Black ctermbg=Blue cterm=none guifg=#ffff00 guibg=#0000ff gui=none
highlight Normal									  guifg=#ffffff guibg=#000000
highlight Search				ctermbg=Yellow							guibg=#c0c000
