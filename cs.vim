"==============================================
" File cs.vim
" Author: Cyrnicolase
"==============================================

if exists("g:phpcs_vim") || &cp
    finish
endif
let g:phpcs_vim = 1

let g:cs_phpcs_path = '/home/work/bin/php-cs-fixer'
let g:phpcs_php_path = get(g:, 'cs_php_path', 'php')
let g:phpcs_path = get(g:, 'cs_phpcs_path')
let g:phpcs_command = g:phpcs_php_path . ' ' . g:phpcs_path . ' fix '

func! PhpcsFix(path)
    let command = g:phpcs_command
    let command = command . ' ' . a:path
    let s:output = system(command)
    if v:shell_error
        echohl Error | echo s:output | echohl None | echo command
    else
        exec 'edit!'
        :set syntax=php
    endif
endfunc

func! PhpcsFixFile()
    call PhpcsFix(expand('%:p'))
endfunc

" Auto command
:autocmd BufWritePost *.php :call PhpcsFixFile()
