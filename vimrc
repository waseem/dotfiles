"
" waseem's ~/.vimrc
"

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set number
set autoindent
set shiftwidth=2
set cindent
set expandtab
set tabstop=2
set term=xterm-256color
set laststatus=2
set statusline=%<%f\ %h%m%r%y%=%-14.(%l,%c%V%)\ %P
set wildmenu
set wrapscan
set cursorline " highlight current line
set undofile
set undodir=~/.vim/undodir

filetype plugin indent on
filetype plugin on
filetype indent on
filetype on
sy on

" Easily open a new tab. This means we will use N to reverse search.
map n :tabnew

" Page Up Page Down just like surfing the net.
noremap <Space> <PageDown>
noremap <BS> <PageUP> 

" Move tabs with  Ctrl+h|l
nnoremap <silent> <C-h> :execute 'silent! tabmove ' . (tabpagenr() - 2)<CR>
nnoremap <silent> <C-l> :execute 'silent! tabmove ' . tabpagenr()<CR>

" Change tabs just like browsing the web
nmap <C-Tab>     :tabnext<CR>
nmap <C-S-Tab>   :tabprevious<CR>
nmap <C-n>       :nohl<CR>
map  <C-Tab>     :tabnext<CR>
map  <C-S-Tab>   :tabprevious<CR>
imap <C-Tab>     <ESC>:tabnext<CR>i
imap <C-S-Tab>   <ESC>:tabprevious<CR>i

" Have focus on the left tab after tabclose
" http://vim.wikia.com/wiki/Have_focus_on_left_tab_after_tabclose
function! CloseSomething()
  if winnr("$") == 1 && tabpagenr("$") > 1 && tabpagenr() > 1 && tabpagenr() < tabpagenr("$")
    tabclose | tabprev
  else
    q
  endif
endfunction
map <C-q> :call CloseSomething()<CR>

" Since h is not use as in h j k l movement, use h as b.
noremap h b

" ^ is quite far to reach.
noremap b ^

" Use j k l ; for cursor movement. The fingers are in touch typing position.
nnoremap j h
nnoremap k j
nnoremap l k
nnoremap ; l

" When reach end of line, keep moving the cursor.
set whichwrap=h,l,~,[,]

" Some abbreviations
abbreviate teh the
abbreviate itn int
abbreviate adn and

" Easy Escape
imap j; <Esc>
imap ;k <Esc>

" Fold settings
set foldmethod=indent  "fold based on indent
set foldnestmax=10     "deepest fold is 10 levels
set nofoldenable       "dont fold by default
set foldlevel=1        "this is just what i use

set ignorecase
set smartcase
set incsearch
set hlsearch
set list listchars=tab:\➜\ ,trail:·,nbsp:-

if $COLORTERM == 'gnome-terminal'
  set term=gnome-256color
  colorscheme railscasts
else
  colorscheme railscasts
endif

" Open a Golang definition in a new tab by default using gd.
" C-] still opens in same tab.
let g:godef_split=2

au BufRead,BufNewFile *.iex set ft=elixir
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au BufRead,BufNewFile *.hamlc set ft=haml
au BufRead,BufNewFile *.god set ft=ruby
au BufRead,BufNewFile *.as set ft=actionscript
au BufRead,BufNewFile Guardfile set ft=ruby
au BufRead,BufNewFile Vagrantfile set ft=ruby
