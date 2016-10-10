# ls aliases
alias ls='ls --color'
alias ll='ls -lh'
alias la='ls -ahl'
alias v='gvim'

alias fuck='sudo $(history -p \!\!)'

# reload
alias rl_es='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.elasticsearch.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.elasticsearch.plist'
alias rl_indexer='launchctl unload ~/Library/LaunchAgents/blablacar.indexer.plist && launchctl load ~/Library/LaunchAgents/blablacar.indexer.plist'
alias rl_fpm='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.php56.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php56.plist'
alias rl_redis='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist'
alias rl_mysql='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mysql56.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql56.plist'
alias rl_rabbitmq='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.rabbitmq.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.rabbitmq.plist'
alias rl_profile='source ~/.bashrc'

# Others
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias count_mysql_connections='watch -n 1 "mysql -uroot -e \"show processlist;\" | wc -l"'
alias mkcd='_(){ mkdir -p $1; cd $1; }; _'
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
alias getbamboopowers='ssh vbbcbamboo1.prod.par-1.h.blbl.cr "ssh-add /space/atlassian/application-data/bamboo/xml-data/configuration/elasticbamboo.pk"'

# Git
alias g='git'
alias gf='git fetch -p'
alias gfmm='git fetch -p && git merge origin/master'
alias gfrm='git fetch -p && git rebase origin/master'
alias gfr='git fetch -p && git rebase '
alias gp='git pull'

# PHP
alias phptags='ctags -R --PHP-kinds=+cf -f tags.vendors vendor && ctags -R --PHP-kinds=+cf src'

# sf2
alias scc='rm -Rf app/cache/*'
alias sfassets='php app/console assets:install web'
alias sfdoctrinerebuild='php app/console doctrine:database:drop --force; php app/console doctrine:database:create; php app/console doctrine:schema:create'
alias sfdoctrinerebuildtest='php app/console doctrine:database:drop --force --env=test; php app/console doctrine:database:create --env=test; php app/console doctrine:schema:create --env=test'
alias pu='vendor/bin/phpunit --colors'
alias pus='pu --stop-on-failure'
alias puf='pu --filter'
alias pud='pu --debug'
alias sfpu='pu -c app'
alias sfpus='sfpu --stop-on-failure'
alias sfpuf='sfpu --filter'
alias sfpud='sfpu --debug'
alias sfcd='php app/console container:debug --show-private'
alias sfcdg='sfcd | grep'

# BlaBlaCar
alias blatail='tail -f app/logs/*.log app/logs/*/*/*.log /tmp/v3worker_*.log'
alias blainitslotgithook='ssh comtools1 "sudo -u www-data /space/products/comuto3/misc/init-slot-githook.sh"'
alias blainitslot='ssh comtools1 "sudo -u www-data /space/products/comuto3/misc/init-slot2.sh"'
alias blacheckbranches='git br -a --merged | grep -v master | grep -v stable'
alias blaindexmembers='/space/products/commands/user/console in:all && /space/products/workers/indexer-member/console consume indexer_member -i -vv'
alias blaindextripoffers='/space/products/commands/indexer-tripoffer/console pu:all && /space/products/workers/indexer-tripoffer/console consume indexer_tripoffer -i -vv'
alias blasatisupdate='ssh bastion.corp.blablacar.net comtools1.prod.par-1.h.blbl.cr -ldev "cd /space/products/composer-packages/satis/ && sudo -u www-data ./bin/satis build packages/comuto3.json www/"'
alias gov3='cd /space/products/bbcthree/comuto3'
alias goworkers='cd /space/products/workers'
alias gocommonds='cd /space/products/commands'
alias gochef='cd /space/products/chef/chef'
alias gocookbooks='cd /space/products/chef/cookbooks'
alias gomisc='cd /space/products/misc'
alias goadmin='cd /space/products/admin'
alias gogateway='cd /space/products/gateway/gateway'
alias gobuildtools='cd /space/products/rkt/build-tools'
alias gogithub='cd /space/github'

# Chef
alias keffcc="knife environment from file /space/products/chef/chef/environments/cm_current.json"
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
alias kdbss="knife data bag show --secret-file /space/products/chef/bootstrap/chef_secret_key"
alias kdbff="knife data bag from file"

# EC2
function aws-sts-decode-authorization-message {
    aws sts decode-authorization-message --encoded-message $1 | sed 's/\\//g' | sed 's/"{"/{"/' | sed 's/}}}"/}}}/'
}

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
