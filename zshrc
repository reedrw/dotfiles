HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=10000

while read -r i; do
	optargs+=("$i")
done << EOF
	HIST_FIND_NO_DUPS
	HIST_IGNORE_ALL_DUPS
	HIST_IGNORE_SPACE
	HIST_REDUCE_BLANKS
	HIST_VERIFY
	INC_APPEND_HISTORY
	SHARE_HISTORY
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

colors
PROMPT="%(!.%B%{$fg[red]%}%n%{$reset_color%}@.%{$fg[green]%}%n%{$reset_color%}@)%m: %(!.%{$bg[red]$fg[black]%}.%{$bg[green]$fg[black]%}) %(!.%d.%~) %{$reset_color%} %(!.#.$) "
RPROMPT="%(?..%{$bg[red]$fg[black]%} %? %{$reset_color%})%B %{$reset_color%}%h"

#  Check if current shell is a ranger subshell
if test "$RANGER_LEVEL"; then
	alias ranger="exit"
	export PROMPT="%{$bg[red]$fg[black]%} RANGER %{$reset_color%} $PROMPT"
fi

PATH=~/.local/bin:$PATH
#FPATH=~/.fpath:$FPATH

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
	Aloxaf/fzf-tab
	zsh-users/zsh-syntax-highlighting
	docker/cli path:contrib/completion/zsh kind:fpath
	robbyrussell/oh-my-zsh path:plugins/sudo
EOF

compinit

local extract="
# trim input
local in=\${\${\"\$(<{f})\"%\$'\0'*}#*\$'\0'}
# get ctxt for current completion
local -A ctxt=(\"\${(@ps:\2:)CTXT}\")
# real path
local realpath=\${ctxt[IPREFIX]}\${ctxt[hpre]}\$in
realpath=\${(Qe)~realpath}
"

FZF_TAB_COMMAND=(
	fzf
	--ansi   # Enable ANSI color support, necessary for showing groups
	--expect='$continuous_trigger' # For continuous completion
	--color=dark
	--nth=2,3 --delimiter='\x00'  # Don't search prefix
	--layout=reverse --height='${FZF_TMUX_HEIGHT:=75%}'
	--tiebreak=begin -m --bind=tab:down,btab:up,change:top,ctrl-space:toggle --cycle
	'--query=$query'   # $query will be expanded to query string at runtime.
	'--header-lines=$#headers' # $#headers will be expanded to lines of headers at runtime
)
zstyle ':fzf-tab:*' command $FZF_TAB_COMMAND

#zstyle ':completion:*' file-sort access
zstyle ':fzf-tab:*' insert-space true
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'exa -1 --color=always $realpath'
zstyle ':fzf-tab:complete:vim:*' extra-opts --preview=$extract'[ -d $realpath ] && exa -1 --color=always $realpath || bat -p --theme=base16 --color=always $realpath'
zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true
zmodload zsh/complist

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

