let g:vim_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/'
exec "source " . g:vim_dir . 'keys'
exec "source " . g:vim_dir . 'plugins'
"exec "source " . g:vim_dir . 'customfunctions'

"Folding bg color change
hi Folded ctermbg=234

set cinkeys=0{,0},:,0#,!^F

" Set color of cursor column/line
highlight CursorColumn ctermbg=Green
highlight CursorLine ctermbg=Green

""" inoremap <silent><expr> <TAB>
"""       \ pumvisible() ? "\<C-n>" :
"""       \ <SID>check_back_space() ? "\<TAB>" :
"""       \ coc#refresh()
""" inoremap <expr><S-TAB>
"""       \ pumvisible() ? "\<C-p>" : "\<C-h>"
"""
""" function! s:check_back_space() abort
"""   let col = col('.')-1
"""   return !col || getline('.')[col-1] =~# '\s'
""" endfunction

let g:python3_host_prog = '/Users/sg0301202/.pyenv/versions/neovim/bin/python'
let g:vim_json_syntax_conceal = 0

let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 1

" vim: ft=vim foldmethod=marker
