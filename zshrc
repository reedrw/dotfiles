# vim:filetype=sh
#                             mm
#                             ##
#         ########  mm#####m  ##m####m   ##m####   m#####m
#             m#"   ##mmmm "  ##"   ##   ##"      ##"    "
#           m#"      """"##m  ##    ##   ##       ##
#  ##     m##mmmmm  #mmmmm##  ##    ##   ##       "##mmmm#
#  ""     """"""""   """"""   ""    ""   ""         """""

[ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] && exec startx

ZSH="$HOME/.oh-my-zsh"

EDITOR="vim"
ZSH_THEME="essembeh"

[ $USER = "root" ] && SCRIPTS="/home/reed/scripts" || SCRIPTS="$HOME/scripts"

BASE16_SHELL="$HOME/.config/base16-shell/"

. "$ZSH/oh-my-zsh.sh"
. "$SCRIPTS/transfer.sh"
. "$HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

"$BASE16_SHELL/scripts/$(< $HOME/.cache/16script/lastuse).sh"

# Aliases{{{
alias aringa="       $SCRIPTS/aringa.sh                    "
alias upgrade="      $SCRIPTS/upgrade.sh                   "
alias c="            $SCRIPTS/clipboard.sh                 "
alias timestamp="    $SCRIPTS/timestamp.sh                 "
alias qimg="         $SCRIPTS/qemuimage.sh                 "
alias qems="         $SCRIPTS/qems.sh                      "
alias panes="        $SCRIPTS/panes                        "
alias lock="         $HOME/.config/i3lock/lock.sh          "
alias cfig="         $EDITOR $HOME/.config/i3/config       "
alias x="            exit                                  "
alias v="            vim                                   "
alias sep="          bg && disown && exit                  "
alias screenrecord=" ffmpeg -f x11grab -s 1366x768 -i :0.0 "
alias open="         xdg-open                              "
alias ls="           exa                                   "
alias load="         xrdb $HOME/.Xresources                "
#}}}
