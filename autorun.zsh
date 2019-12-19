SCRIPTS="$HOME/scripts"

# auto startx
[[ -t 0 && $(tty) == /dev/tty1 && ! $DISPLAY ]] && startx

# No typing "sudo"
while read -r i; do
	alias "$i=sudo $i"
done << EOF
	dispatch-conf
	emaint
	emerge
	eselect
	layman
	poweroff
	quickpgk
	reboot
EOF

if test "$RANGER_LEVEL"; then
#	alias ranger="exit"
	export PROMPT="%F{red}(RANGER $RANGER_LEVEL)%f $PROMPT"
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

# Load colorscheme (for vim config)
$SCRIPTS/walper.sh -s

# aliases
while read -r i; do
	alias "$i"
done << EOF
	c=$SCRIPTS/clipboard.sh
	timestamp=$SCRIPTS/timestamp.sh
	x=exit
	ls=exa
	htop=htop -t
	scp=scp -r
EOF
