export EDITOR="vim"
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export LS_COLORS='di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
export HISTCONTROL=ignoredups
export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.6.12.0/libexec"
export EC2_URL="https://ec2.eu-west-1.amazonaws.com"
export DOCKER_HOST=tcp://

export JBOSS_HOME=/usr/local/opt/jboss-as/libexec

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
if [ -f ~/.bash_secret ]; then
	. ~/.bash_secret
fi
if [ -f ~/.bash_prompt ]; then
	. ~/.bash_prompt
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
	. `brew --prefix`/etc/bash_completion
fi

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:${JBOSS_HOME}/bin:$PATH"
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

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
