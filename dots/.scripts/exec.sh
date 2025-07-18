#!/bin/bash

# --- Paleta de Cores Roxo ---
BG_NORMAL="#0C0012"      # Fundo: Roxo super escuro
FG_NORMAL="#CBC9CC"      # Texto: Cinza claro
BG_SELECTED="#BE95FF"   # Destaque: Roxo vibrante
FG_SELECTED="#0C0012"      # Texto do Destaque: Roxo super escuro

# Usa dmenu_run para listar aplicativos e aplicar o tema
dmenu_run -x 550 -y 300 -z 250 -l 5 \
    -fn "FiraCode Nerd Font:size=10" \
    -nb "${BG_NORMAL}" \
    -nf "${FG_NORMAL}" \
    -sb "${BG_SELECTED}" \
    -sf "${FG_SELECTED}" \
    -p "Run:"
