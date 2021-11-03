source ~/.vim/plug.vim " package management

syntax on
filetype plugin indent off
colorscheme elflord

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set formatoptions=q2
set autoindent
set nosmarttab " change indents from literal tabs to a bunch of spaces (huh?)
set expandtab " make indents spaces not tabs
set shiftwidth=4 " how many spaces make up a smarttab
set tabstop=4 " set the display width of tabs (just in case of a literal tab)
set visualbell t_vb=
set novisualbell
set textwidth=70
set hlsearch
set modeline
set ignorecase
set smartcase " searches with uppercase are still case-sensitive
set wildmenu " shows completion menu in command mode
set wildmode=list:longest " bash-style completion
set scrolloff=3 " scroll before cursor hits bottom or top line
set pastetoggle=<F2>
set nobackup
set nowritebackup
set noswapfile
set hidden " disable error on closing unwritten buffer
set ruler " always show line,column and line/line-total
set iskeyword=@,48-57,_,192-255 " make dot word boundary!
set gdefault " search and replace all matches by default
set nrformats=hex " who uses octal?? 07 should increment to 08
set statusline=%f\ %h%w%m%r\ %=\(%o\)\ %(%l,%c%V\ %=\ %P%)
set guioptions-=m
set guioptions-=T
set guifont=Menlo\ Regular:h13
set guicursor+=a:blinkon0
set mouse=a
set clipboard=unnamed

let mapleader = ","

noremap <C-s> :w<CR>
noremap <C-p> :bp<CR>
noremap <C-n> :bn<CR>
noremap <C-h> :noh<CR>
noremap <F8> :TagbarToggle<CR>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
nnoremap <C-k> :bd<CR>
" close current buffer without touching windows
nnoremap <silent> <Leader>bd :Bclose<CR>
" copy selected lines with lines joined
vnoremap <leader>yl "+y:let @+=substitute(substitute(t, '\_s\_s\+', ' ', 'g'), '^\_s*\|\_s*$', '', 'g')<CR>
" ctrl keys left in normal mode: j, q, ', ", .?
"vnoremap <C-c> "+y
"inoremap <C-v> <esc>"+pa " replaces insert literal key

noremap <Esc>1 :bf<CR>
noremap <Esc>2 :bf<CR>:bn1<CR>
noremap <Esc>3 :bf<CR>:bn2<CR>
noremap <Esc>4 :bf<CR>:bn3<CR>
noremap <Esc>5 :bf<CR>:bn4<CR>
noremap <Esc>6 :bf<CR>:bn5<CR>
noremap <Esc>7 :bf<CR>:bn6<CR>
noremap <Esc>8 :bf<CR>:bn7<CR>
noremap <Esc>9 :bf<CR>:bn8<CR>
noremap <Esc>0 :blast<CR>

noremap <D-w> :bd<CR>
noremap <C-tab> :tabnext<CR>
noremap <C-S-tab> :tabprevious<CR>
"noremap <C-S-t> :tabnew<CR> " -S is ignored in at least MacVim, killing <C-t>
noremap <D-1> 1gt
noremap <D-2> 2gt
noremap <D-3> 3gt
noremap <D-4> 4gt
noremap <D-5> 5gt
noremap <D-6> 6gt
noremap <D-7> 7gt
noremap <D-8> 8gt
noremap <D-9> 9gt

nmap <Leader>b :Buffers<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>t :Tags<CR>
nmap <Leader>l :let @+=@% . ':' . line('.')<CR>

command! B buffers

" copy number to number below then increment. lh at end fixes spurious cursor down motion
let @i = "\"zyej?[^0-9]\<CR>lde\"zP\<C-a>?[^0-9]\<CR>l:noh\<CR>lh"
let @i = "\"zywj?[^0-9]\<CR>ldw\"zP\<C-a>?[^0-9]\<CR>l:noh\<CR>lh"

" extension settings
let g:tagbar_compact = 1

" local overwrites
if !empty(glob("~/.vim/local.vim"))
    source ~/.vim/local.vim
endif
