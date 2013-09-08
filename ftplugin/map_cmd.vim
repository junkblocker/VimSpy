if exists("b:did_ftplugin")
    finish
endif
let b:scriptnames = ScriptList()
" Don't load another plugin for this buffer
let b:did_ftplugin = 1

let cpo_save = &cpo
set cpo-=C

if has('syntax')
    setlocal nospell
endif

map <buffer> <2-LeftMouse> :GoToFunction<CR>
map <buffer> <CR> :GoToFunction<CR>

let &cpo = cpo_save
