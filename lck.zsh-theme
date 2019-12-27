if [[ $UID -eq 0 ]]; then
    local user_host='%{$fg[yellow]%}[%{$reset_color%}%%{$fg[red]%}n%{$fg[yellow]%}]─[%{$reset_color%}%~%{$fg[yellow]%}]%{$reset_color%}'
else
    local user_host='%{$fg[yellow]%}[%{$reset_color%}%n%{$fg[yellow]%}]─[%{$reset_color%}%~%{$fg[yellow]%}]%{$reset_color%}'
fi

PS1="%{$fg[yellow]%}╭─${user_host}
%{$fg[yellow]%}╰> %{$reset_color%}"

PS2="%{$fg[yellow]%}╰> %{$reset_color%}"

RPS1='$(git_line)'

ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✔%{$reset_color%}"

git_line() {
    if [ -n "$(current_branch)" ]; then
        GCA=$(git_commits_ahead 2> /dev/null)
        if [[ $GCA == "" ]]; then GCA="0" fi
        GCB=$(git_commits_behind 2> /dev/null)
        if [[ $GCB == "" ]]; then GCB="0" fi

        # Dirty or not?
        echo -n "%{$fg[yellow]%}[%{$reset_color%}$(parse_git_dirty)%{$fg[yellow]%}]-"
        git rev-parse --abbrev-ref --symbolic-full-name @{u} &> /dev/null
        if [ $? -eq 0 ]; then
            # Ahead / Behind
            echo -n "[%{$reset_color%}↑$GCA%{$fg[yellow]%}|%{$reset_color%}$GCB↓%{$fg[yellow]%}]-"
        fi
        # Branch / Hash
        echo "[%{$reset_color%}$(git_current_user_name)@$(current_branch)%{$fg[yellow]%}]%{$reset_color%}"
    fi
}
