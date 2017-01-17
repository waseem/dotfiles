colorscheme railscasts
set go-=r " Remove right scroll bar
set go-=T " Remove toolbar
set go-=m " Remote menu bar

if has("gui_macvim")
  set guifont=Menlo:h14
else
  set guifont=xos4\ Terminus\ 10
endif

"
" Wrap long lines
"
set wrap linebreak nolist showbreak=↪

if &diff
  colorscheme slate
endif
