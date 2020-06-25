SCRIPTS="$HOME/scripts"

# auto startx
[[ -t 0 && $(tty) == /dev/tty1 && ! $DISPLAY ]] && ! [[ $USER == "root" ]] && startx

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

export VISUAL=nvim
export EDITOR=nvim

export MANPAGER="nvim -c 'set ft=man' -"
export CM_LAUNCHER=rofi

# Remove autocreated directories
while read -r i; do
	todel+=("$i")
done << EOF
	$HOME/*.core
	$HOME/Desktop
	$HOME/Downloads
	$HOME/nohup.out
	$HOME/*.hup
	$HOME/.wget-hsts
	$HOME/.lesshst
	$HOME/.fehbg
	$HOME/.lyrics
EOF
rm -rf "${todel[@]}" > /dev/null
unset todel

# Load colorscheme into terminal (for vim config)
$SCRIPTS/walper.sh -s

# aliases
while read -r i; do
	aliasargs+=("$i")
done << EOF
	x=exit
	ls=exa -lh --git
	tree=exa --tree
	htop=htop -t
	which=whence
	cp=cp -v
	ln=ln -v
	mv=mv -v
	rm=rm -v
EOF
alias "${aliasargs[@]}"
unset aliasargs

export GPG_TTY=$(tty)

if [ -e /home/reed/.nix-profile/etc/profile.d/nix.sh ]; then . /home/reed/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
