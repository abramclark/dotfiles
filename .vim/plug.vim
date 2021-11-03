call plug#begin('~/.vim/plugged')

Plug '/usr/local/opt/fzf' " basic fzf search support
Plug 'junegunn/fzf.vim' " search buffers, files and tags
Plug 'w0rp/ale' " asynchronous linting
Plug 'airblade/vim-gitgutter' " git status in gutter
Plug 'tpope/vim-fugitive' " git tools like :Gblame
Plug 'sheerun/vim-polyglot' " massive syntax support, mainly for (un)commenting

" Old and probably useless
"Plug 'severin-lemaignan/vim-minimap'
"Plug 'abramclark/qvim'
"Plug 'majutsushi/tagbar'
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'

call plug#end()
