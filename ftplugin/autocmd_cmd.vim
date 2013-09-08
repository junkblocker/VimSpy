if exists("b:did_ftplugin")
    finish
endif
let b:scriptnames = ScriptList()
" Don't load another plugin for this buffer
let b:did_ftplugin = 1

let cpo_save = &cpo
set cpo-=C

function! s:add_undo_ftplugin(entry)
  if exists('b:undo_ftplugin')
    let b:undo_ftplugin .= ' | ' . a:entry
  else
    let b:undo_ftplugin = a:entry
  endif
endfunction

if has('syntax')
    setlocal nospell
    call s:add_undo_ftplugin('setlocal spell<')
endif

if !b:b0
    map <buffer> <2-LeftMouse> :GoToFunctionCmd<CR>
    map <buffer> <CR> :GoToFunctionCmd<CR>
    call s:add_undo_ftplugin('silent! execute ''unmap <buffer> <2-LeftMouse>''')
    call s:add_undo_ftplugin('silent! execute ''unmap <buffer> <CR>''')
endif

let &cpo = cpo_save
