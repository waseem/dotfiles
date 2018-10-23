#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
  xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
  xmodmap $sysmodmap
fi

# Pull settings from ~/.Xresources
if [ -f "$userresources" ]; then
  xrdb -merge "$userresources"
fi

# Swap caps lock with left control
if [ -f "$usermodmap" ]; then
  xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi


# setup icon tray
# trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent true --tint 0x000000 --height 12 &

# start screensaver
xscreensaver -no-splash &

# set the cursor
xsetroot -cursor_name left_ptr

# set wallpaper
[[ -f ~/.fehbg ]] && eval `cat ~/.fehbg`

# Use more fonts
xset +fp /usr/share/fonts/local
xset fp rehash

# Shut up system beep: xset b to renable
xset -b

# Accelerate the mouse pointer https://wiki.archlinux.org/index.php/Mouse_acceleration#Using_xset
xset m 15/1 0

# Start dropbox in background
#dropboxd &

# exec gnome-session
# exec startkde
#exec startxfce4
# ...or the Window Manager of your choice
# xmonad

# twm &
# xclock -geometry 50x50-1+1 &
# xterm -geometry 80x50+494+51 &
# xterm -geometry 80x20+494-0 &
# exec xterm -geometry 80x66+0+0 -name login

exec i3
