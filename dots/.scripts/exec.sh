#!/bin/bash

# Exibe o prompt do dmenu com as novas configurações e captura o comando digitado
cmd=$(echo "" | dmenu -x 550 -y 300 -z 250 -l 5 -fn "FiraCode Nerd Font:size=10" -nb "#111111" -nf "#bbbbbb" -sb "#afafaf" -sf "#111111" -p "Command:")

# Verifica se o usuário digitou algo e executa o comando
if [ -n "$cmd" ]; then
    eval "$cmd"
fi
