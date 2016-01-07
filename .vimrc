let mapleader = ","
let g:mapleader = ","

set so=5
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set laststatus=2
set hlsearch
set ignorecase

set nocompatible               " be iMproved
filetype off                   " required!

" chinese character supported
set fileencodings=utf-8,cp936,gbk,default,latin1
set encoding=utf-8
set termencoding=utf-8

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
Bundle 'Valloric/YouCompleteMe'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'pbrisbin/vim-mkdir'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive' 
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/ctags.vim'
Bundle 'vim-scripts/matchit.zip'
Bundle 'vim-scripts/tComment'
Bundle "mattn/emmet-vim"
Bundle "scrooloose/nerdtree"
Bundle "Lokaltog/vim-powerline"
" Bundle "bling/vim-airline"
Bundle "godlygeek/tabular"
Bundle "msanders/snipmate.vim"
Bundle "jelera/vim-javascript-syntax"
Bundle "altercation/vim-colors-solarized"
Bundle "othree/html5.vim"
Bundle "xsbeats/vim-blade"
Bundle "Raimondi/delimitMate"
Bundle "groenewege/vim-less"
Bundle "evanmiller/nginx-vim-syntax"
Bundle "Lokaltog/vim-easymotion"
Bundle "tomasr/molokai"
Bundle "klen/python-mode"
Bundle "shawncplus/phpcomplete.vim"
Bundle "jiangmiao/auto-pairs"

" vim-scripts repos
Bundle 'taglist.vim'

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required!
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
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_php_checkers = ["php"]


""""""""""""""""""""""""""""""""""""""""""""
"       PowerLine
""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'fancy'


""""""""""""""""""""""""""""""""""""""""""""
"       AirLine
""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme="luna" 
" let g:airline_theme="molokai"
" let g:airline_powerline_fonts = 1 


""""""""""""""""""""""""""""""""""""""""""""
"       PHP
""""""""""""""""""""""""""""""""""""""""""""
set ofu=syntaxcomplete#Complete
autocmd FileType php set complete+=k~/.vim/dict/PHP.dict
set dictionary=/home/work/.vim/dict/php.dict
map <leader>run :w<CR>:!php %<CR>


""""""""""""""""""""""""""""""""""""""""""""
"       Emmet
"       ref: http://www.jianshu.com/p/67fa1e2114c5
""""""""""""""""""""""""""""""""""""""""""""
let g:user_emmet_install_global=0
autocmd filetype html,css EmmetInstal


