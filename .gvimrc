
""""""""""""""""""""""""""""""""""""""""""""
"       gvim 基础配置
""""""""""""""""""""""""""""""""""""""""""""

" 基础设置
set guioptions-=m       " 隐藏菜单栏
set guioptions-=T       " 隐藏工具栏
set guioptions-=L       " 隐藏左侧滚动条
set guioptions-=r       " 隐藏右侧滚动条
set guioptions-=b       " 隐藏底部滚动条
set showtabline=0       " 隐藏tab标签
set background=dark     " 设置背景色为黑色
set vb t_vb=            " 关闭警告音

au GUIEnter * call MaximizeWindow()  " 窗口最大化, 以来 wmctrl

function MaximizeWindow()
   silent !wmctrl -r :ACTIVE: -b  add,maximized_vert,maximized_horz
endfunction

" 字体设置
" set guifont=Noto\ Mono\ for\ Powerline\ Regular\ 12
set guifont=Courier\ 12

Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
Bundle 'chriskempson/tomorrow-theme'
Bundle 'chriskempson/base16'
Bundle 'chriskempson/vim-tomorrow-theme'


""""""""""""""""""""""""""""""""""""""""""""
"       vim-colors-solarized
""""""""""""""""""""""""""""""""""""""""""""
" syntax enable
" set background=dark
" colorscheme solarized
let g:solarized_termcolors=256


""""""""""""""""""""""""""""""""""""""""""""
"       vim-color-molokai
""""""""""""""""""""""""""""""""""""""""""""
" syntax enable
" set background=dark
" let g:molokai_original = 1
" colorscheme molokai

""""""""""""""""""""""""""""""""""""""""""""
"       vim-colors-tomorrow
""""""""""""""""""""""""""""""""""""""""""""
" colorscheme Tomorrow-Night
" colorscheme Tomorrow-Night-Bright


