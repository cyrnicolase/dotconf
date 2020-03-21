" 版本管理工具vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

filetype plugin indent on     " required!
let mapleader = ","
let g:mapleader = ","

map <leader>t :tabnew<CR>
map <leader>x : bdelete %<CR>

nnoremap <s-tab> : bp<cr>
nnoremap <tab> : bn<cr>
nnoremap <c-l> : buffers<cr>

set completeopt-=preview " 关闭preview 窗口

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nu
set so=5
set shiftwidth=4
set tabstop=4
set softtabstop=4
set laststatus=2
set fileformats=unix,dos
set autoindent
set expandtab
set smarttab
set smartindent
" set cindent
set hlsearch
set ignorecase
" set ruler
set cursorline
set nobackup
set nocompatible               " be iMproved

set guifont=Go\ Mono\ for\ Powerline\ 12
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" filetype off                   " required!

" chinese character supported
set fileencodings=utf-8,cp936,gbk,default,latin1
set encoding=utf-8
set termencoding=utf-8

" GUI without menu and toolbar
if has('gui_running') && filereadable("~/.gvimrc")
    source ~/.gvimrc
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 新文件自动添加头部内容
" 通过命令方式给文件增加通用注释
autocmd BufNewFile *.py,*.sh,*.php exec ":call SetTitle()"
nnoremap <leader>ah :call SetTitle()<cr>
func SetTitle()
    if &filetype == 'python'
        call append(0, "\#!/usr/bin/env python")
        call append(1, "\# -*- coding:utf-8 -*-")   " `.`文中光标所在行
        call append(2, "'''")     
        call append(3, "DocString")
        call append(4, "'''")
        call append(5, "")
    elseif &filetype == 'php'
        call append(0, "<?php")
        call append(1, "")
    elseif &filetype == 'sh'
        call append(0, "\#!/bin/bash")
        call append(1, "")
    elseif &filetype == 'lua'
        call append(0, "\#!/usr/local/bin/lua")
        call append(1, "")
    endif

    " 跳转到光标以前的位置
    normal :line(".")
    normal i
endfunc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 执行当前编辑文件脚本
" map <leader>php :w<CR>:!php %<CR>
" map <leader>py :w<CR>:!python %<CR>

nnoremap <s-r> : call RunScript()<cr>
func RunScript()
    execute "w"
    if &filetype == 'php'
        execute "!php %"
    elseif &filetype == 'python'
        execute "!python %"
    elseif &filetype == 'sh'
        execute "!bash %"
    elseif &filetype == 'go'
        execute "!go run %"
    elseif &filetype == 'lua'
        execute "!lua %"
    endif
endfunc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" open json file with javascript syntastic
autocmd BufNewFile,BufRead *.json,*.js set filetype=javascript
autocmd BufNewFile,BufRead *.conf set filetype=nginx

command! BcloseOthers call <SID>BufCloseOthers()  
function! <SID>BufCloseOthers()  
    let l:currentBufNum   = bufnr("%")  
    let l:alternateBufNum = bufnr("#")  
    for i in range(1, bufnr("$"))  
        if buflisted(i)  
            if i != l:currentBufNum  
                execute("bdelete ".i)
            endif  
        endif  
    endfor  
endfunction  
map <leader>bdo :BcloseOthers<cr> 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Bundle 'VundleVim/Vundle.vim'
" My Bundles here:
" original repos on github
" Bundle 'croaky/vim-colors-github'
" Bundle 'kchmck/vim-coffee-script'
" Bundle 'slim-template/vim-slim'
" Bundle 'thoughtbot/vim-rspec'
" Bundle 'vim-ruby/vim-ruby'
" Bundle 'tpope/vim-rails'
" Bundle 'xsbeats/vim-blade'
" Bundle 'altercation/vim-colors-solarized'
" Bundle 'tpope/vim-bundler'
" Bundle 'vim-scripts/matchit.zip'
" Bundle 'vim-scripts/tComment'
" Bundle 'mattn/emmet-vim'
" Bundle 'msanders/snipmate.vim'
" Bundle 'klen/python-mode'
" Bundle 'shawncplus/phpcomplete.vim'
" Bundle 'pangloss/vim-javascript'
" Bundle 'stephpy/vim-php-cs-fixer'
" Bundle 'airblade/vim-gitgutter'
" Bundle 'tomasr/molokai'
" Bundle 'pbrisbin/vim-mkdir'
" Bundle 'tpope/vim-endwise'
" Bundle 'jelera/vim-javascript-syntax'
" Bundle 'othree/html5.vim'
" Bundle 'tpope/vim-surround'
" Bundle 'docunext/closetag.vim'
" Bundle 'vim-scripts/ctags.vim'
" Bundle 'scrooloose/syntastic'

Bundle 'vim-scripts/indentpython.vim'
Bundle 'Yggdroot/indentLine'
Bundle 'chr4/nginx.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'posva/vim-vue'
Bundle 'majutsushi/tagbar'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-fugitive' 
" Bundle 'Valloric/YouCompleteMe'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-airline/vim-airline'
Bundle 'godlygeek/tabular'
Bundle 'cyrnicolase/auto-pairs'
Bundle 'cyrnicolase/vim-php-cs'
Bundle 'mhinz/vim-grepper'
Bundle 'chase/vim-ansible-yaml'
Bundle 'fatih/vim-go'
Bundle 'w0rp/ale'
Bundle 'sonph/onehalf', {'rtp': 'vim/'}
Bundle 'mhartington/oceanic-next'

call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""
"        Tagbar 
"""""""""""""""""""""""""""""""""""""""""""""
map <silent> <F3> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

""""""""""""""""""""""""""""""""""""""""""""
"       NerdTree
""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeDirArrows=1
let g:NERDTreeDirArrowExpandable = "+"
let g:NERDTreeDirArrowCollapsible = "~"
let g:NERDTreeCascadeOpenSingleChildDir = 1
let g:NERDTreeAutoCenterThreshold = 1
let g:NERDTreeShowHidden = 0
let g:NERDTreeIgnore = ['node_modules', "\.pyc$"]
map <F2> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""
"       Syntastic
""""""""""""""""""""""""""""""""""""""""""""
" let g:syntastic_check_on_open=1
" let makeprg = "php -l -d error_reporting=E_ALL -d display_errors=1"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_python_checkers = []
let g:syntastic_aggregate_errors = 1
let g:syntastic_php_phpmd_exec = "~/bin/phpmd"
let g:syntastic_php_phpmd_post_args = "~/.vim/rulesets.xml"
let syntastic_mode_map = {'passive_filetypes': ['html']}    " 忽略非标准html报错


""""""""""""""""""""""""""""""""""""""""""""
"       Ale
""""""""""""""""""""""""""""""""""""""""""""
let b:ale_fixers = {
\   'php': ['php_cs_fixer'],
\   'go' : ['gofmt'],
\}
let g:ale_linters = {
\   'php': ['php', 'phpmd'],
\   'go': ['golint'],
\   'python': ['pylint'],
\}
let g:ale_set_highlights = 0
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_insert_leave = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '>>'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 0     " 错误解决后，自动错误关闭窗口
let g:ale_php_phpmd_ruleset = "~/.vim/rulesets.xml"
let g:ale_list_window_size = 5
highlight clear ALEErrorSign
highlight clear ALEWarningSign

map <F4> :ALEToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""
"       AirLine
""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1 

if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
" let g:airline_left_sep = '▶'
" let g:airline_left_alt_sep = '❯'
" let g:airline_right_sep = '◀'
" let g:airline_right_alt_sep = '❮'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'

""""""""""""""""""""""""""""""""""""""""""""
"       PHP
""""""""""""""""""""""""""""""""""""""""""""

" autocmd Filetype php setlocal omnifunc=phpcomelete#Complete
autocmd Filetype php call AddPHPFuncList()
function AddPHPFuncList()
    set directory-=~/.vim/dict/php_function.txt directory+=~/.vim/dict/php_function.txt
    set complete-=k complete+=k
endfunction


""""""""""""""""""""""""""""""""""""""""""""
"       Emmet
"       ref: http://www.jianshu.com/p/67fa1e2114c5
""""""""""""""""""""""""""""""""""""""""""""
" let g:user_emmet_install_global=0
" autocmd filetype html,css EmmetInstal




"""""""""""""""""""""""""""""""""""""""""""""
"        Auto-Pairs 
"""""""""""""""""""""""""""""""""""""""""""""
let g:AutoPairsFlyMode = 0
let g:AutoPairsExclude = {'php': ["<?", "<?php", "'''"],}
let g:AutoPairsExtra = {
\'html': {'<!--': '-->', '{%' : '%}'},
\'go': {'func main(': ') {\n\n}', 'go func(': ") {\n\n}",},
\}


"""""""""""""""""""""""""""""""""""""""""""""
"        PHPComplete 
"""""""""""""""""""""""""""""""""""""""""""""
" let g:phpcomplete_relax_static_constraint = 1
" let g:phpcomplete_complete_for_unknown_classes = 1


"""""""""""""""""""""""""""""""""""""""""""""
"        YouCompleteme 
"""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_complete_in_comments = 1
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_filetype_blacklist = {
\   'tagbar' : 1,
\   'qf' : 1,
\   'notes' : 1,
\   'markdown' : 1,
\   'unite' : 1,
\   'text' : 1,
\   'vimwiki' : 1,
\   'pandoc' : 1,
\   'infolog' : 1,
\   'mail' : 1
\}

"设置关健字触发补全
let g:ycm_semantic_triggers = {
\   'c' : ['->', '.', ' ', '(', '[', '&'],
\   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
\             're!\[.*\]\s'],
\   'ocaml' : ['.', '#'],
\   'cpp,objcpp' : ['->', '.', '::'],
\   'perl' : ['->'],
\   'php' : ['->', '::'],
\   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir' : ['.'],
\   'ruby' : ['.', '::'],
\   'lua' : ['.', ':'],
\   'erlang' : [':'],
\}
let g:ycm_cache_omnifunc = 1
let g:ycm_use_ultisnips_completer = 1



"""""""""""""""""""""""""""""""""""""""""""""
"        PHP-cs-fixer
"""""""""""""""""""""""""""""""""""""""""""""
" let g:php_cs_fixer_path = "php ~/bin/php-cs-fixer" " define the path to the php-cs-fixer
" let g:php_cs_fixer_level = "all"                " which level ?
" let g:php_cs_fixer_config = "default"           " configuration
" let g:php_cs_fixer_php_path = "/usr/local/php/bin/php"             " Path to PHP
" let g:php_cs_fixer_default_mapping = 1          " Enable the mapping by default (<leader>pcd)
" let g:php_cs_fixer_dry_run = 0                  " Call command with dry-run option"
" 
" map <leader>pcd :call PhpCsFixerFixDirectory()<CR>
" map <leader>pcf :call PhpCsFixerFixFile()<CR>



"""""""""""""""""""""""""""""""""""""""""""""
"        colorscheme
"""""""""""""""""""""""""""""""""""""""""""""
" let g:molokai_original=1
let g:rehash256=1



"""""""""""""""""""""""""""""""""""""""""""""
"        IndentLine
"""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_color_term = 239
let g:indentline_char = 'c'


"""""""""""""""""""""""""""""""""""""""""""""
"        ctrlp
"""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_custom_ignore = 'node_modules\|aop' "ignore node_modules directory



"""""""""""""""""""""""""""""""""""""""""""""
"        vim-php-cs
"""""""""""""""""""""""""""""""""""""""""""""
let g:phpcs_php_path = 'php'
let g:phpcs_path = '~/bin/php-cs-fixer'
let g:phpcs_using_cache = 0



"""""""""""""""""""""""""""""""""""""""""""""
"        vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = '<C-m>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<Esc>'


"""""""""""""""""""""""""""""""""""""""""""""
"        vim-vue
"""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css


"""""""""""""""""""""""""""""""""""""""""""""
"        mhinz/vim-grepper
"""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>g :Grepper -tool ag<cr>
nnoremap <leader>G :Grepper -tool git<cr>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Optional. The default behaviour should work for most users.
let g:grepper               = {}
let g:grepper.tools         = ['git', 'ag', 'rg']
let g:grepper.jump          = 1
let g:grepper.next_tool     = '<leader>g'
let g:grepper.simple_prompt = 1
let g:grepper.quickfix      = 0



"""""""""""""""""""""""""""""""""""""""""""""
"        vim-ansible-yaml
"""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead,BufNewFile *.yaml,*.yml setlocal filetype=ansible
let g:ansible_options = {'ignore_blank_lines': 0}


"""""""""""""""""""""""""""""""""""""""""""""
"        vim-onehalflight
"""""""""""""""""""""""""""""""""""""""""""""
" colorscheme onehalflight
" colorscheme onehalfdark
" let g:airline_theme='onehalfdark'


""""""""""""""""""""""""""""""""""""""""""""
"       oceanic-next
""""""""""""""""""""""""""""""""""""""""""""
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

