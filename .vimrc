" 版本管理工具vundle
" git clone https://github.com/gmarik/vundle.git  ~/.vim/bundle/vundle

filetype plugin indent on     " required!
let mapleader = ","
let g:mapleader = ","

map <leader>t :tabnew<CR>
map <leader>j :set filetype=javascript<CR>:w<CR>

set so=5
set shiftwidth=4
set tabstop=4
" set softtabstop=4
set laststatus=2
set fileformat=unix
set autoindent
set expandtab
set smarttab
" set cindent
set hlsearch
set ignorecase
set ruler
set nobackup

set nocompatible               " be iMproved
" filetype off                   " required!

" chinese character supported
set fileencodings=utf-8,cp936,gbk,default,latin1
set encoding=utf-8
set termencoding=utf-8

" new file auto add header by filetype
autocmd BufNewFile *.sh,*.php exec ":call SetTitle()"
func SetTitle()
    if &filetype == 'php'
        call setline(1, "<?php")
        call setline(2, "")
    endif
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
        call setline(2, "")
    endif

    " jump to the last line
    autocmd BufNewFile * normal G
endfunc

" open json file with javascript syntastic
autocmd BufNewFile,BufRead *.json set filetype=javascript


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
" original repos on github
" Bundle 'croaky/vim-colors-github'
" Bundle 'kchmck/vim-coffee-script'
" Bundle 'slim-template/vim-slim'
" Bundle 'thoughtbot/vim-rspec'
" Bundle 'vim-ruby/vim-ruby'
" Bundle 'tpope/vim-rails'
" Bundle 'xsbeats/vim-blade'
" Bundle 'Lokaltog/vim-powerline'
" Bundle 'altercation/vim-colors-solarized'
Bundle 'Valloric/YouCompleteMe'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'pbrisbin/vim-mkdir'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive' 
" Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/ctags.vim'
Bundle 'vim-scripts/matchit.zip'
" Bundle 'vim-scripts/tComment'
" Bundle 'mattn/emmet-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
Bundle 'godlygeek/tabular'
" Bundle 'msanders/snipmate.vim'
Bundle 'jelera/vim-javascript-syntax'
" Bundle 'othree/html5.vim'
Bundle 'groenewege/vim-less'
Bundle 'evanmiller/nginx-vim-syntax'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'tomasr/molokai'
" Bundle 'klen/python-mode'
" Bundle 'shawncplus/phpcomplete.vim'
Bundle 'jiangmiao/auto-pairs'
Bundle 'pangloss/vim-javascript'
" Bundle 'stephpy/vim-php-cs-fixer'
Bundle 'docunext/closetag.vim'
" Bundle 'Yggdroot/indentLine'
Bundle 'dericofilho/vim-phpfmt'
" Bundle 'airblade/vim-gitgutter'

" vim-scripts repos
" Bundle 'taglist.vim'

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


"""""""""""""""""""""""""""""""""""""""""""""
"        Taglist 
"""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compact_Format = 0
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_File_Fold_Auto_Close = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Max_Submenu_Items = 1
let Tlist_Max_Tag_Length = 30
let Tlist_Process_File_Always = 0
let Tlist_Show_Menu = 0
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 40
" 已经不更新了
map <silent> <F4> :TlistToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""
"        Tagbar 
"""""""""""""""""""""""""""""""""""""""""""""
map <silent> <F3> :TagbarToggle<CR>
let g:tagbar_autofocus = 1


""""""""""""""""""""""""""""""""""""""""""""
"       NerdTree
""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeDirArrows=0
let g:NERDTreeDirArrowExpandable = "+"
let g:NERDTreeDirArrowCollapsible = "~"
let g:NERDTreeCascadeOpenSingleChildDir = 1
let g:NERDTreeAutoCenterThreshold = 1
let g:NERDTreeShowHidden = 0
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
let g:syntastic_aggregate_errors = 1
let g:syntastic_php_phpmd_exec = "~/bin/phpmd"
let g:syntastic_php_phpmd_post_args = "~/.vim/custom/ruleset.xml"


""""""""""""""""""""""""""""""""""""""""""""
"       PowerLine
""""""""""""""""""""""""""""""""""""""""""""
" set laststatus=2
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'fancy'


""""""""""""""""""""""""""""""""""""""""""""
"       AirLine
""""""""""""""""""""""""""""""""""""""""""""
" set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline_theme="luna" 
" let g:airline_theme="molokai"
" let g:airline_theme="solarized"
let g:airline_powerline_fonts = 1 
" nnoremap <C-N>: bn<CR>
" nnoremap <C-P>: bp<CR>


""""""""""""""""""""""""""""""""""""""""""""
"       PHP
""""""""""""""""""""""""""""""""""""""""""""
map <leader>run :w<CR>:!php %<CR>

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
let g:user_emmet_install_global=0
autocmd filetype html,css EmmetInstal



""""""""""""""""""""""""""""""""""""""""""""
"       vim-colors-solarized
""""""""""""""""""""""""""""""""""""""""""""
syntax enable
" set background=dark
" colorscheme solarized

" syntax enable
" set background=light
" colorscheme solarized

"""""""""""""""""""""""""""""""""""""""""""""
"        Auto-Pairs 
"""""""""""""""""""""""""""""""""""""""""""""
let g:AutoPairsFlyMode = 0


"""""""""""""""""""""""""""""""""""""""""""""
"        PHPComplete 
"""""""""""""""""""""""""""""""""""""""""""""
" let g:phpcomplete_relax_static_constraint = 1
" let g:phpcomplete_complete_for_unknown_classes = 1


"""""""""""""""""""""""""""""""""""""""""""""
"        PHP-cs-fixer
"""""""""""""""""""""""""""""""""""""""""""""
" let g:php_cs_fixer_path = "~/bin/php-cs-fixer" " define the path to the php-cs-fixer
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
let g:molokai_original=1
let g:rehash256=1


"""""""""""""""""""""""""""""""""""""""""""""
"        dericofilho/vim-phpfmt
"""""""""""""""""""""""""""""""""""""""""""""
let g:phpfmt_on_save = get(g:, 'phpfmt_on_save', 1) " format on save (autocmd)
let g:phpfmt_indent_with_space = 4         " use spaces instead of tabs for indentation
let g:phpfmt_config = "/home/work/.vim/custom/phpfmt.ini"
" let g:phpfmt_php_path = "php"               " Path to PHP
" let g:phpfmt_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
" let g:phpfmt_indent_with_space = 4         " use spaces instead of tabs for indentation
" let g:phpfmt_enable_auto_align = 1         " Enable auto align of = and =>
" let g:visibility_order = 1          " Fixes visibiliy order for method in classes - PSR-2 4.2
" let g:smart_linebreak_after_curly = 1      " Convert multistatement blocks into multiline blocks
" let g:phpfmt_update_on_open = 0     " No self update



"""""""""""""""""""""""""""""""""""""""""""""
"        IndentLine
"""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_color_term = 239
let g:indentline_char = 'c'


"""""""""""""""""""""""""""""""""""""""""""""
"        ctrlp
"""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_custom_ignore = 'node_modules\|aop' "ignore node_modules directory


