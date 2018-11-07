# vim:filetype=sh
#┌────────────────────────────────────────────────────────┐
#│▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒│
#│▒▒┌──────────────┐░▒┌──────────────┐░▒┌───┐░▒▒▒▒▒┌───┐░▒│
#│▒▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒│▓▒▒│░▒▒▒▒▒│▓▒▒│░▒│
#│▒▒└───────────┐▓▒│░▒│▓▒┌───────────┘░▒│▓▒▒│░▒▒▒▒▒│▓▒▒│░▒│
#│▒▒▒▒▒▒▒▒▒▒▒▒▒▒│▓▒│░▒│▓▒│░▒▒▒▒▒▒▒▒▒▒▒▒▒│▓▒▒│░▒▒▒▒▒│▓▒▒│░▒│
#│▒▒┌───────────┘▓▒│░▒│▓▒└───────────┐░▒│▓▒▒│░▒▒▒▒▒│▓▒▒│░▒│
#│▒▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒│▓▒▒└──────┘▓▒▒│░▒│
#│▒▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒└───┐▓▒▒▒▒▒▒▒▒▒│░▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒│
#│▒▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒▒▒▒▒│▓▒▒▒▒▒▒▒▒▒│░▒│▓▒▒┌──────┐▓▒▒│░▒│
#│▒▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒┌─┐░│▓▒▒▒▒▒▒▒▒▒│░▒│▓▒▒│░▒▒▒▒▒│▓▒▒│░▒│
#│▒▒│▓▒▒▒▒▒▒▒▒┌────┘░▒│▓│░│▓▒▒▒▒▒▒▒▒▒│░▒│▓▒▒│░▒▒▒▒▒│▓▒▒│░▒│
#│▒▒│▓▒▒▒▒▒▒▒▒│░▒▒▒▒▒▒│▓│░│▓▒▒▒▒▒▒▒▒▒│░▒│▓▒▒│░▒▒▒▒▒│▓▒▒│░▒│
#│▒▒│▓▒▒▒▒▒▒▒▒└────┐░▒│▓└─┘▓▒▒▒▒▒▒▒▒▒│░▒│▓▒▒│░▒▒▒▒▒│▓▒▒│░▒│
#│▒▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒│▓▒▒│░▒▒▒▒▒│▓▒▒│░▒│
#│▒▒└──────────────┘░▒└──────────────┘░▒└───┘░▒▒▒▒▒└───┘░▒│
#│▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒│
#└─┐▓▒▒▒▒▒┌───┐┌─┐▒┌──┐▓▒▒▒▒▒▒┌┐┌──┐▒┌───┐┌┐┌┐▒▒▒▒▒▒▒▒▒┌──┘
#  │▓▒▒▒▒▒│   ││ │▒│  │┌──┐▓▒▒│││  │▒│   │││││▒┌─┐▒┌┐▒▒│
#  │▓▒▒▒▒▒│   ││ │▒│  ││  │▓▒▒│││  │▒│   │││││▒│ │▒││▓▒│
#  └──┬┬─┬┤   ││ │▒│  ││  └──┬┘││  │▒│   ││└┘│▒│ │▓││▓▒│
#   ▓▒├┘▒││   ││ │▒│  ││       ││  │▒│   ├┘  │▓│ ├─┘│▓▒│
#   ▓▒│  ││   ││ └─┘  └┘     │ ││  │▒│   │   │▓│    │┌┐│
#   ▓     │   └┘               ││  │▒│       └─┘ │  ││││
#                            │ ││  │▒│   │   ┌─┐ │  ││││
#   ▓ │   │                    ││  │┌┘   │   │▒│    └┘││
#         │                    ││  ││        └─┘ │    ││
#                              ││  ││    │            ││
#       ▒ │                    ││  └┘         ▓       └┘
#                              ││                     ┌┐
#                              ││                     └┘
#                              └┘                     ┌┐
#                              ┌┐                     └┘
#                              ││
#                              ││
#                              └┘

userroot(){
	SCRIPTS="/home/reed/scripts"
}

userreed(){
	SCRIPTS="${HOME}/scripts"
	"${SCRIPTS}/walper.sh" -s

	sucom=(dispatch-conf emaint emerge eselect layman poweroff reboot)
	for command in "${sucom[@]}"; do
		alias $command="sudo $command"
	done
}

[[ -t 0 && $(tty) == /dev/tty1 && ! $DISPLAY ]] && startx

ZSH="${HOME}/.zsh/oh-my-zsh"

EDITOR="vim"

ZSH_DISABLE_COMPFIX="true"

[ ${USER} = "root" ] && userroot || userreed

. "${HOME}/.zsh/oh-my-zsh/oh-my-zsh.sh"
. "${HOME}/.zsh/sudo.plugin.zsh"
. "${HOME}/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
. "${SCRIPTS}/transfer.sh"

PS1="%{$fg[magenta]%}%n%{$reset_color%} @ %{$fg[red]%}%\♥ %{$fg[yellow]%}%~ %{$reset_color%}"

test $RANGER_LEVEL && alias ranger="exit"

sh -c '(rm -rf ${HOME}/*.core ${HOME}/Desktop ${HOME}/Downloads ${HOME}/nohup.out ${HOME}/*.hup > /dev/null 2>&1 &)'


for oct in {0..511}; do
	printf "%o\n" $oct
done | for oct0 in $(</dev/stdin); do
	printf "%03d\n" $oct0
done | for oct1 in $(</dev/stdin); do
	alias $oct1="chmod $oct1";
done

alias aringa="       ${SCRIPTS}/aringa.sh"
alias c="            ${SCRIPTS}/clipboard.sh"
alias mp3="          ${SCRIPTS}/mp3.sh"
alias nerdinfo="     ${SCRIPTS}/nerdinfo"
alias panes="        ${SCRIPTS}/panes"
alias qems="         ${SCRIPTS}/qems.sh"
alias qimg="         ${SCRIPTS}/qemuimage.sh"
alias screenrecord=" ${SCRIPTS}/screenrecord.sh"
alias timestamp="    ${SCRIPTS}/timestamp.sh"
alias cfig="         ${EDITOR} ${HOME}/.config/i3/config"
alias ls="           exa"
alias open="         xdg-open"
alias sep="          bg; disown; exit"
alias x="            exit"

ldu() { command du -ahLd 1 2> /dev/null | sort -rh }
0x0() { curl -F"file=@$1" https://0x0.st }
