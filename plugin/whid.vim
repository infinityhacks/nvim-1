" Prevent loading file twice
if exists('g:loaded_whid') | finish | endif
let g:loaded_whid = 1

let s:save_cpo = &cpo " save user coptions
set cpo&vim " reset them to defaults

hi def link WhidHeader      Number
hi def link WhidSubHeader   Identifier

" Command to run our plugin
command! Whid lua require('zoom.whid').whid()

let &cpo = s:save_cpo " and restore after
unlet s:save_cpo

