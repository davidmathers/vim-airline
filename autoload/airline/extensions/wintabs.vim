" MIT License. Copyright (c) 2013-2016 Bailey Ling.
" vim: et ts=2 sts=2 sw=2

scriptencoding utf-8

if !exists('*wintabs#get_status_string')
  finish
endif

let s:overwrite = get(g:, 'airline#extensions#wintabs#overwrite_variables', 1)

function! airline#extensions#wintabs#init(ext)
  if s:overwrite
    highlight wintabs_active gui=bold cterm=bold term=bold
    highlight link wintabs_hidden airline_c
    let g:wintabs_ui_modified = g:airline_symbols.modified
    let g:wintabs_ui_readonly = g:airline_symbols.readonly
    let g:wintabs_ui_sep_leftmost = ''
    let g:wintabs_ui_sep_inbetween = ''
    let g:wintabs_ui_sep_rightmost = ''
    let g:wintabs_ui_active_left = ''
    let g:wintabs_ui_active_right = ''
    let g:wintabs_ui_active_higroup = 'wintabs_active'
    let g:wintabs_ui_hidden_higroup = 'wintabs_hidden'
  endif

  if exists("+autochdir") && &autochdir == 1
    " if 'acd' is set, vim-airline uses the path section, so we need to redefine this here as well
    call airline#parts#define_raw('path', '%{wintabs#refresh_bufstrings()}'.wintabs#get_status_string())
  else
    call airline#parts#define_raw('file', '%{wintabs#refresh_bufstrings()}'.wintabs#get_status_string())
  endif
endfunction
