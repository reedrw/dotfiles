HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=10000

setopt autocd correct HIST_FIND_NO_DUPS

PROMPT="%F{green}%n%f@%m:%f[%F{green}%~%f] $ "
[[ "$(whoami)" == "root" ]] && PROMPT="%F{red}%n%f@%m:%f[%F{green}%~%f] %F{red}#%f "

PATH=~/.local/bin:$PATH

[[ -d ~/.local/bin ]] || mkdir -p ~/.local/bin
[[ -d ~/bin        ]] && PATH=~/bin:$PATH

while read -r i; do
	alias "$i"
done << EOF
	ls=ls -FN --color=auto
	grep=grep --color=auto
	free=free -h
	mkdir=mkdir -p
EOF

command -v antibody > /dev/null || \
	curl -sfL git.io/antibody | sh -s - -b ~/.local/bin

. <(dircolors -b; antibody init)
test -f ~/.autorun.zsh && . ~/.autorun.zsh

antibody bundle << EOF
	zdharma/fast-syntax-highlighting
	robbyrussell/oh-my-zsh path:plugins/sudo
	ael-code/zsh-colored-man-pages
EOF

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
autoload -U compinit

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

unset HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND
unset HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND

bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}"  end-of-line
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

#autoload -U compinit
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true
zmodload zsh/complist
compinit -i
