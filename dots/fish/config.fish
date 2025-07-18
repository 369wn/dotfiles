if status is-interactive

    alias jbl 'bluetoothctl connect 70:99:1C:A6:9E:BA'
    alias fone 'bluetoothctl remove 41:42:27:90:00:00 && bluetoothctl scan on && bluetoothctl connect 41:42:27:90:00:00'
    alias djbl 'bluetoothctl disconnect 70:99:1C:A6:9E:BA'
    alias dfone 'bluetoothctl disconnect 41:42:27:90:00:00'
    
    alias vimconfig='nvim ~/.config/nvim'
    alias dots='nvim ~/.config'
    alias vim='nvim'
    set CONFIG ~/.config


set -U fish_greeting
set -x XDG_CONFIG_HOME $HOME/.config
export EDITOR=nvim

end
fish_add_path ~/.spicetify
if test -z "$DISPLAY" -a (tty) = "/dev/tty1"
    startx
end

if status is-interactive
and not set -q TMUX
    if command -v tmux >/dev/null
        tmux new-session -s "sessao-"(echo %self)
    end
end
