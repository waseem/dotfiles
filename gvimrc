colorscheme railscasts
set go-=r " Remove right scroll bar
set go-=T " Remove toolbar
set go-=m " Remote menu bar

if has("gui_macvim")
  set guifont=Menlo:h14
else
  set guifont=Iosevka\ 12
  "set guifont=Monospace\ Regular\ 12
  "set guifont=Terminus
endif

"
" Wrap long lines
"
set wrap linebreak nolist showbreak=↪

if &diff
  colorscheme slate
endif
