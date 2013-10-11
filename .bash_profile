export EDITOR="vim"
export CLICOLOR=1
export HISTCONTROL=ignoredups
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_40.jdk/Contents/Home/

export JBOSS_HOME=/usr/local/opt/jboss-as/libexec

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:${JBOSS_HOME}/bin:$PATH"

function _git_prompt() {
local git_status="`git status -unormal 2>&1`"
if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
    if [[ "$git_status" =~ nothing\ to\ commit ]]; then
        local ansi=42
    elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
        local ansi=43
    else
        local ansi=45
    fi
    if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
        branch=${BASH_REMATCH[1]}
        test "$branch" != master || branch=' '
    else
        # Detached HEAD.  (branch=HEAD is a faster alternative.)
        branch="(`git describe --all --contains --abbrev=4 HEAD 2> /dev/null ||
            echo HEAD`)"
    fi
    echo -n '\[\e[0;37;'"$ansi"';1m\]'"$branch"'\[\e[0m\] '
fi
}
function _prompt_command() {
PS1="`_git_prompt`"'\h:\w\$ '
}
PROMPT_COMMAND=_prompt_command

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# Color man entries
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}

# Change default ulimit to avoir errors
ulimit -n 1024
