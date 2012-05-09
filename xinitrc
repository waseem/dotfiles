#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi


# setup icon tray
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent true --tint 0x000000 --height 12 &

# start screensaver
xscreensaver -no-splash &

# set the cursor
xsetroot -cursor_name left_ptr

# set wallpaper
[[ -f ~/.fehbg ]] && eval `cat ~/.fehbg`

# Swap caps lock with left control
[[ -f ~/.xmodmap ]] && xmodmap ~/.xmodmap

# Use more fonts
xset +fp /usr/share/fonts/local
xset fp rehash

# Start dropbox in background
#dropboxd &

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
xmonad
