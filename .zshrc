ZSH=$HOME/.oh-my-zsh
ZSH_THEME="lck"
COMPLETION_WAITING_DOTS="true"

plugins=(
	autojump
	colored-man-pages
	colorize
	command-not-found
	cp
	debian
	dircycle
	docker
	extract
	git
	gitfast
	git-extras
	gitignore
	gradle
	history
	history-substring-search
	mvn
	node
	npm
	sudo
	urltools
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
# plugin:autojump
source /usr/share/autojump/autojump.sh

# plugin:zsh-autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=0"
# export ZSH_AUTOSUGGEST_STRATEGY="default"

# History
export   HISTFILE=~/.history
export   HISTSIZE=1000
export   SAVEHIST=1000
unsetopt SHARE_HISTORY
setopt   HIST_IGNORE_DUPS
setopt	 HIST_EXPIRE_DUPS_FIRST
setopt	 HIST_REDUCE_BLANKS

# Correction
unsetopt CORRECT
unsetopt CORRECTALL

# Ls
export LS_COLORS="di=00;35:ex=1;35:ln=3;35"
alias  ls='ls --color=always --group-directories-first'
alias  l='exa -alhm --time-style=iso --group-directories-first'
alias  ll='ls -alhF'

alias cp='cpv'

alias fda='fd -HI'
alias vim='nvim'
alias zrc='vim ~/.zshrc'
alias src='source ~/.zshrc'

alias ping='prettyping --nolegend'
alias po='ping 8.8.8.8'

# Some keyboard special bindings
bindkey "^[[3~"    delete-char
bindkey "^[3;5~"   delete-char
bindkey '^[[1~' beginning-of-line
bindkey '^[[H' beginning-of-line
bindkey '^[OH' beginning-of-line
bindkey '^[[7~' beginning-of-line
bindkey "^A" beginning-of-line
bindkey '^[[4~' end-of-line
bindkey '^[[F' end-of-line
bindkey '^[OF' end-of-line
bindkey '^[[8~' end-of-line
bindkey '^E' end-of-line
bindkey "^F" history-incremental-search-forward
bindkey "^R" history-incremental-search-backward

# Moving around
setopt   AUTO_PUSHD
unsetopt AUTO_CD
alias dirs='dirs -v'
alias gitroot='cd `git rev-parse --show-toplevel`'

# Paths
export PYTHONPATH=$PYTHONPATH:./.pip
export JAVA_HOME=/opt/lib/jdk1.8.0_172
export GOPATH=$HOME/Prog/project/go
export PATH=/usr/local/go/bin:/snap/bin:/opt/lib/apache-maven-3.5.3/bin:$JAVA_HOME/bin:$PATH:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin:$HOME/.cabal/bin:/usr/bin/cargo:$HOME/.cargo/bin:$GOPATH
source $HOME/.bw
# GPG
export GPG_TTY=$(tty)

# Misc
export EDITOR=vim
export TERM='xterm'
alias mkdir='mkdir -p'
alias grep='grep -n --color'

if [ -f $HOME/.profile ] ; then
	source $HOME/.profile
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/lucas/.sdkman"
[[ -s "/home/lucas/.sdkman/bin/sdkman-init.sh" ]] && source "/home/lucas/.sdkman/bin/sdkman-init.sh"
export PATH="/home/lucas/Prog/ide/idea-IC-183.4886.37/bin:/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh