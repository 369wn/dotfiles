#!/bin/bash

function powermenu {
  options="Cancel\nShutdown\nRestart\nLock"
  selected=$(echo -e "$options" | dmenu -x 550 -y 300 -z 250 -l 5 -fn "FiraCode Nerd Font:size=10" -nb "#111111" -nf "#bbbbbb" -sb "#afafaf" -sf "#111111")
  if [[ $selected = "Shutdown" ]]; then
    loginctl poweroff
  elif [[ $selected = "Restart" ]]; then
    loginctl reboot
  elif [[ $selected = "Lock" ]]; then
    slock
  elif [[ $selected = "Cancel" ]]; then
    return
  fi
}

powermenu

