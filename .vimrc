source ~/.vim/vundle.vim " bundle / package management

syntax on
filetype plugin indent on
colorscheme elflord

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set formatoptions=q2
set guifont=Menlo\ Regular:h14
set ai " for retaining indent after newline in insert mode
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

"" my key remaps 
no <C-s> :w<CR>
no <C-x> \r<CR>\e
no <C-p> :bp<CR>
no <C-n> :bn<CR>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
no <C-h> :noh<CR>
nmap <C-k> :b#<bar>bd#<CR>
" ctrl keys in normal mode left: j, q, ', ", .?

no <Esc>1 :bf<CR>
no <Esc>2 :bf<CR>:bn1<CR>
no <Esc>3 :bf<CR>:bn2<CR>
no <Esc>4 :bf<CR>:bn3<CR>
no <Esc>5 :bf<CR>:bn4<CR>
no <Esc>6 :bf<CR>:bn5<CR>
no <Esc>7 :bf<CR>:bn6<CR>
no <Esc>8 :bf<CR>:bn7<CR>
no <Esc>9 :bf<CR>:bn8<CR>
no <Esc>0 :blast<CR>

map <C-tab> :tabnext<CR>
map <C-S-tab> :tabprevious<CR>
map <C-S-t> :tabnew<CR>
"map <C-w> :tabclose<CR> " can't remap window key!
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt

"" my nifty macros
let @i = '"zyljx"zP'
