#!/bin/bash

# Load X resources
xrdb ~/.Xresources

# Keyboard layout
setxkbmap -layout br &

# Enable NumLock
numlockx &

# Restore wallpaper
~/.fehbg &

# Notification daemon
dunst &

# Status bar
slstatus &

# Compositor (uncomment if needed)
# picom --config ~/.config/picom/picom.conf &

pipewire &

# Start DWM in a loop to allow restarts after crash
while true; do
    dwm 2> ~/.dwm.log
done

