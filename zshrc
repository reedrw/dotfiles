#               __
#   ____  _____/ /_  __________
#  /_  / / ___/ __ \/ ___/ ___/
# _ / /_(__  ) / / / /  / /__
#(_)___/____/_/ /_/_/   \___/
#

[ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] && startx

EDITOR=/usr/bin/vim

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="essembeh"

SCRIPTS="$HOME/scripts"
[ $USER = "root" ] && SCRIPTS=/home/reed/scripts

BASE16_SHELL=$HOME/.config/base16-shell/
plugins=(git fast-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source $SCRIPTS/transfer.sh
source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
# {{{
+x(){ chmod +x $1 }
alias aringa="$SCRIPTS/aringa.sh"
alias c="$SCRIPTS/clipboard.sh"
alias panes="$SCRIPTS/panes"
alias qems="$SCRIPTS/qems.sh"
alias qimg="$SCRIPTS/qemuimage.sh"
alias timestamp="$SCRIPTS/timestamp.sh"

alias cfig="$EDITOR $HOME/.config/i3/config"
alias load="xrdb $HOME/.Xresources"
alias lock="$HOME/.config/i3lock/lock.sh"
alias ls="exa"
alias open="xdg-open"
alias p="pac"
alias screenrecord="ffmpeg -f x11grab -s 1366x768 -i :0.0"
alias sep="bg && disown && exit"
alias v="vim"
alias x="exit"
#}}}


[ -f $HOME/.cache/16script/lastuse ] && $HOME/.config/base16-shell/scripts/"$(cat $HOME/.cache/16script/lastuse).sh"
