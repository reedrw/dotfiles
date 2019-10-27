HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=10000

setopt autocd correct

PROMPT="%F{green}%n%f@%m:%f[%F{green}%~%f] $ "
[[ "$(whoami)" == "root" ]] && PROMPT="%F{red}%n%f@%m:%f[%F{green}%~%f] %F{red}#%f "

if test "$RANGER_LEVEL"; then
	alias ranger="exit"
	export PROMPT="%F{red}(RANGER)%f $PROMPT"
fi

PATH=~/.local/bin:$PATH

[[ -d ~/.local/bin ]] || mkdir -p ~/.local/bin
[[ -d ~/bin        ]] && PATH=~/bin:$PATH

alias ls="ls     --color=auto"
alias grep="grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}"

command -v exa > /dev/null && \
	alias ls="exa"

command -v antibody > /dev/null || \
	curl -sfL git.io/antibody | sh -s - -b ~/.local/bin

. <(dircolors -b; antibody init)
test -f ~/.autorun.zsh && . ~/.autorun.zsh

antibody bundle << EOF
	zdharma/fast-syntax-highlighting
	zsh-users/zsh-history-substring-search
	robbyrussell/oh-my-zsh path:plugins/sudo
	ael-code/zsh-colored-man-pages
EOF

unset HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND
unset HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND

bindkey "${terminfo[kcuu1]}" history-substring-search-up
bindkey "${terminfo[kcud1]}" history-substring-search-down

autoload -U compinit
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true
zmodload zsh/complist
compinit
