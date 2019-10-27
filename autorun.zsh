# auto startx
[[ -t 0 && $(tty) == /dev/tty1 && ! $DISPLAY ]] && startx

# Gentoo specific
sucom=(dispatch-conf emaint emerge eselect layman poweroff quickpkg reboot)
for command in "${sucom[@]}"; do
	alias $command="sudo $command"
done

# export EDITOR
VISUAL=vim; export VISUAL
EDITOR=vim; export EDITOR

# Remove autocreated directories
sh -c '(rm -rf ${HOME}/*.core ${HOME}/Desktop ${HOME}/Downloads ${HOME}/nohup.out ${HOME}/*.hup > /dev/null 2>&1 &)'

# Load colorscheme (for vim config)
~/scripts/walper.sh -s

# aliases
alias c=~/scripts/clipboard.sh
alias x=exit
