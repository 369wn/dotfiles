#!/bin/bash

# --- Paleta de Cores Roxo ---
BG_NORMAL="#0C0012"      # Fundo: Roxo super escuro
FG_NORMAL="#CBC9CC"      # Texto: Cinza claro
BG_SELECTED="#BE95FF"   # Destaque: Roxo vibrante
FG_SELECTED="#0C0012"      # Texto do Destaque: Roxo super escuro

# Define as opções do menu com ícones do Nerd Fonts
#  (Shutdown)   (Restart)   (Lock)   (Cancel)
function powermenu {
  options=" Cancel\n Shutdown\n Restart\n Lock"
  selected=$(echo -e "$options" | dmenu -x 550 -y 300 -z 250 -l 5 \
      -fn "FiraCode Nerd Font:size=10" \
      -nb "${BG_NORMAL}" \
      -nf "${FG_NORMAL}" \
      -sb "${BG_SELECTED}" \
      -sf "${FG_SELECTED}")

  # Executa a ação baseada na seleção
  case "$selected" in
    " Shutdown")
      loginctl poweroff
      ;;
    " Restart")
      loginctl reboot
      ;;
    " Lock")
      slock
      ;;
    " Cancel")
      return
      ;;
  esac
}

# Chama a função
powermenu
