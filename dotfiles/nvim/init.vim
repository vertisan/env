call plug#begin(stdpath('data') . '/plugged')
" Plugins ...

Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'ap/vim-css-color'
Plug 'kevinoid/vim-jsonc'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

set number

" Spaces & Tabs {{{
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line
" }}} Spaces & Tabs
