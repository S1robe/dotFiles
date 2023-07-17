#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

source "$HOME/.zprofile"

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

if [ $(head -n 1 /etc/hostname) = "Core" ]; then
    

    xset -dpms # no sleepy monitors
    xset r rate 300 50 # key refresh rate
    xset s 60       # spacing rate
    xset -b         # disable bell
    setxkbmap -option terminate:ctrl_alt_bksp # zapping 

    exec i3

fi


exec dwm
