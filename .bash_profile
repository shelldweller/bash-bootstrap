# Aliases
alias ll='ls -l'
alias la='ls -la'
alias k='kubectl'

# Enable colorization for ls command
export CLICOLOR=1


# Local scripts and shortcuts
export PATH="$HOME/bin:$PATH"


# Prompt for current git branch
show_git_branch() {
    branch=$(git branch 2>/dev/null | grep '^*' | colrm 1 2)
    if [ -n "$branch" ]; then
        echo -n "($branch)"
    fi
}

# Prompt for current kube context
show_kube_context() {
    context=$(kubectl config current-context 2>/dev/null)
    if [ -n "$context" ]; then
        emoji=''
        if [[ $context =~ 'k8s-prod' ]]; then
            emoji='🔥'
        fi
        echo -n " [$emoji$context]"
    fi
}


PS1='\[\033[0;90m\]\u$(show_kube_context) \w \[\033[0;36m\]$(show_git_branch)\n\[\033[0;90m\]↳\[\033[0m\] '
