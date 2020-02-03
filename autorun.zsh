SCRIPTS="$HOME/scripts"

# auto startx
[[ -t 0 && $(tty) == /dev/tty1 && ! $DISPLAY ]] && startx

# No typing "sudo"
while read -r i; do
	sudoargs+=("$i=sudo $i")
done << EOF
	dnf
	poweroff
	reboot
EOF
alias "${sudoargs[@]}"
unset sudoargs

if test "$RANGER_LEVEL"; then
	alias ranger="exit"
	export PROMPT="%{$bg[red]$fg[black]%} RANGER %{$reset_color%} $PROMPT"
fi

# export EDITOR
VISUAL=vim; export VISUAL
EDITOR=vim; export EDITOR

# Remove autocreated directories
while read -r i; do
	todel+=("$i")
done << EOF
	$HOME/*.core
	$HOME/Desktop
	$HOME/Downloads
	$HOME/nohup.out
	$HOME/*.hup
EOF
rm -rf "${todel[@]}" > /dev/null
unset todel

# Load colorscheme (for vim config)
$SCRIPTS/walper.sh -s

# aliases
while read -r i; do
	aliasargs+=("$i")
done << EOF
	c=$SCRIPTS/clipboard.sh
	timestamp=$SCRIPTS/timestamp.sh
	x=exit
	ls=exa
	tree=exa --tree
	df=pydf
	htop=htop -t
	scp=scp -r
EOF
alias "${aliasargs[@]}"
unset aliasargs
