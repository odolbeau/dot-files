# ls aliases
alias ls='ls --color'
alias ll='ls -lh'
alias la='ls -ahl'
alias v='gvim'

alias fuck='sudo $(history -p \!\!)'

# reload
alias rl_profile='source ~/.bashrc'

# Others
alias count_mysql_connections='watch -n 1 "mysql -uroot -e \"show processlist;\" | wc -l"'
alias mkcd='_(){ mkdir -p $1; cd $1; }; _'

# Git
alias g='git'
alias gf='git fetch -p'
alias gfmm='git fetch -p && git merge origin/master'
alias gfrm='git fetch -p && git rebase origin/master'
alias gfr='git fetch -p && git rebase '
alias gp='git pull'

# sf2
alias scc='rm -Rf var/cache/*'
alias pu='vendor/bin/phpunit --colors'
alias pus='pu --stop-on-failure'
alias puf='pu --filter'
alias pud='pu --debug'
alias sfpu='pu -c app'
alias sfpus='sfpu --stop-on-failure'
alias sfpuf='sfpu --filter'
alias sfpud='sfpu --debug'
alias sfcd='php bin/console debug:container --show-private'
alias sfcdg='sfcd | grep'

# Go!
alias gogithub='cd /space/github'

# Chef
alias kcu="knife cookbook upload --freeze"
alias kcuf="knife cookbook upload --force"
alias kcd="knife cookbook delete"
alias kcs="knife cookbook show"
alias kcl="knife cookbook list"
alias kns="knife node show"
alias kne="knife node edit"
alias knd="knife node delete"
alias knl="knife node list"
alias krs="knife role show"
alias krd="knife role delete"
alias kre="knife role edit"
alias kre="knife role list"
alias kcld="knife client delete"
alias kdbs="knife data bag show"
alias kdbl="knife data bag list"
alias kdbff="knife data bag from file"

function ksnbyrecipe {
    recipe=default
    if [ $# -eq 2 ]; then
        recipe=$2
    fi
    knife search "recipes:$1\:\:$recipe"
}

function kupdatenodes {
    recipe=default
    if [ $# -eq 2 ]; then
        recipe=$2
    fi
    knife ssh -x root "recipes:$1\:\:$recipe" "chef-client"
}

# Usage: find ... | delete_trailing_spaces
function delete_trailing_spaces {
    xargs perl -pi -e 's/[ ]*$//'
}

# Display number of lines & files.
# Usage: find ... | print_stats
function print_stats {
    xargs -L 1 wc -l | awk '{l+=$0} {f+=1} END {print "lines: " l} END {print "files: " f}'
}

# Fork a repo like a boss!
function fork() {
  if [ "$#" -ne 1 ]; then
    echo "USAGE: fork author/repo"
  fi

  # Move to where forks live and clone the original repo.
  cd /space/github/forks
  git clone git://github.com/${1}.git

  # Strip the "author/" prefix from "author/repo" for the directory name
  cd $(echo $1 | sed 's/.*\///')

  hub fork
}

# Clone a repo like a boss!
function clone() {
  if [ "$#" -ne 1 ]; then
    echo "USAGE: clone author/repo"
  fi

  # Move to where forks live and clone the original repo.
  cd /space/github/forks
  git clone git://github.com/${1}.git

  # Strip the "author/" prefix from "author/repo" for the directory name
  cd $(echo $1 | sed 's/.*\///')
}
