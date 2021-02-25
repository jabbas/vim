let g:vim_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/'
exec "source " . g:vim_dir . 'keys'
exec "source " . g:vim_dir . 'plugins'
"exec "source " . g:vim_dir . 'customfunctions'
