HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=10000

while read -r i; do
	optargs+=("$i")
done << EOF
	HIST_FIND_NO_DUPS
	appendhistory
	autocd
	correct
	incappendhistory
	sharehistory
	promptsubst
EOF
setopt "${optargs[@]}"
unset optargs

while read -r i; do
	autoload -U "$i"
done << EOF
	colors
	compinit
	down-line-or-beginning-search
	up-line-or-beginning-search
EOF

colors && {
PROMPT="%(!.%{$fg[red]%}%n%{$reset_color%}.%{$fg[green]%}%n%{$reset_color%})@%m: %(!.%{$bg[red]$fg[black]%}.%{$bg[green]$fg[black]%}) %(!.%d.%~) %{$reset_color%} %(!.#.$) "
RPROMPT="%(?..%{$bg[red]$fg[black]%} %? %{$reset_color%})%{$bg[black]$fg[white]%} %h %{$reset_color%}"
}

PATH=~/.local/bin:$PATH

[[ -d ~/.local/bin ]] || mkdir -p ~/.local/bin
[[ -d ~/bin        ]] && PATH=~/bin:$PATH

while read -r i; do
	aliasargs+=("$i")
done << EOF
	ls=ls -FN --color=auto
	grep=grep --color=auto
	free=free -h
	mkdir=mkdir -p
EOF
alias "${aliasargs[@]}"
unset aliasargs

command -v antibody > /dev/null || \
	curl -sfL git.io/antibody | sh -s - -b ~/.local/bin

. <(dircolors -b; antibody init)
test -f ~/.autorun.zsh && . ~/.autorun.zsh

antibody bundle << EOF
	zdharma/fast-syntax-highlighting
	robbyrussell/oh-my-zsh path:plugins/sudo
	ael-code/zsh-colored-man-pages
EOF

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
