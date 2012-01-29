export CLICOLOR=1
export PS1='\h:\w\$ '

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
export PATH=/usr/local/Cellar/ctags/5.8/bin:/usr/local/share/python:/usr/local/Cellar/php/5.3.8/bin:/usr/local/sbin:$PATH
