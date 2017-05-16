
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

" 字体设置
set guifont=Monaco:h14
set guifont=Monospace\ 14


Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'


""""""""""""""""""""""""""""""""""""""""""""
"       vim-colors-solarized
""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256


""""""""""""""""""""""""""""""""""""""""""""
"       vim-molokai
""""""""""""""""""""""""""""""""""""""""""""
" syntax enable
" set background=dark
" let g:molokai_original = 1

