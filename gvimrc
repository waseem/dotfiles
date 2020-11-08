colorscheme railscasts
set go-=r " Remove right scroll bar
set go-=T " Remove toolbar
set go-=m " Remove menu bar
set cursorline " highlight current line

if has("gui_macvim")
  set guifont=Menlo:h14
else
  "set guifont=Iosevka\ 12
  "set guifont=Monospace\ Regular\ 12
  set guifont=Terminus\ 12
endif

if &diff
  colorscheme slate
endif
