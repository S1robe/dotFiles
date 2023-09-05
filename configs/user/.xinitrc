#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap


# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

# Rebind the keys from the system
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

# Remidn the keybinds for the user
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# Starts and loads requried modules for display and permissions
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


# Change keybinds
    #Mouse keys

# X-server specific settings

xset r rate 250 50 # key refresh rate
xset -b         # disable bell
xset -dpms       # dynamic power management system
xset s 300      # sleep 5 minutes


exec i3
