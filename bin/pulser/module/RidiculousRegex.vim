" Forgot to put single quotes around dictionary indices:
"   `mydict[some_key]` --> `mydict['some_key']`:
" Use `VISUAL LINE` or `VISUAL BLOCK` to highlight
"   relevant section, then:
:s_\[\([[:alnum:]\|_]\+\)\]_['\1']_g 
