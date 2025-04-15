#!/bin/bash

function powermenu {
  options="Cancel\nShutdown\nRestart\nLock"
  selected=$(echo -e "$options" | dmenu)
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

