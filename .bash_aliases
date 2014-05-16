# ls aliases
alias ll='ls -lh'
alias la='ls -ahl'
alias v='mvim'

# reload
alias rl_es='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.elasticsearch.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.elasticsearch.plist'
alias rl_indexer='launchctl unload ~/Library/LaunchAgents/blablacar.indexer.plist && launchctl load ~/Library/LaunchAgents/blablacar.indexer.plist'
alias rl_fpm='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.php54.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php54.plist'
alias rl_redis='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist'
alias rl_mysql='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist'
alias rl_rabbitmq='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.rabbitmq.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.rabbitmq.plist'
alias rl_profile='source ~/.bash_profile'

# Others
alias ctags_php='ctags -f tags -h ".php" -R --exclude=".svn" --exclude="*.sql" --exclude="*/cache/**" --exclude="*.min.js" --totals=yes --tag-relative=yes --PHP-kinds=+cf --fields=+afkst --regex-PHP="/@method[ ][^ ]+[ ]+([^ (]*)/\1/f/"'
alias ctags_java='ctags -f tags -R --exclude=".svn" --exclude="*.sql" --language-force=java'
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias count_mysql_connections='watch -n 1 "mysql -uroot -e \"show processlist;\" | wc -l"'

# Git
alias g='git'
alias gf='git fetch -p'
alias gfmm='git fetch -p && git merge origin/master'
alias gfrm='git fetch -p && git rebase origin/master'
alias gfr='git fetch -p && git rebase '
alias gp='git pull'
alias gdb='git br -d'

# PHP & env
alias stop-fpm='kill `cat /usr/local/var/run/php-fpm.pid`'

# sf2
alias scc='rm -Rf app/cache/*'
alias sfassets='php app/console assets:install web'
alias sfdoctrinerebuild='php app/console doctrine:database:drop --force; php app/console doctrine:database:create; php app/console doctrine:schema:create'
alias sfdoctrinerebuildtest='php app/console doctrine:database:drop --force --env=test; php app/console doctrine:database:create --env=test; php app/console doctrine:schema:create --env=test'
alias sfpu='phpunit --colors -c app'
alias sfpus='sfpu --stop-on-failure'
alias sfpuf='sfpu --filter'
alias sfpud='sfpu --debug'
alias phpcsfixer='php-cs-fixer fix src/ --fixers=indentation,trailing_spaces,unused_use,php_closing_tag,return,braces,phpdoc_params,eof_ending,extra_empty_lines,include,controls_spaces,elseif'
alias sfcd='php app/console container:debug --show-private'
alias sfcdg='sfcd | grep'

# BlaBlaCar
alias blatail='tail -f app/logs/*.log app/logs/*/*/*.log /tmp/v3worker_*.log'
alias blatrans='php app/console blablacar:translation:update --force; php app/console blablacar:translation:update; rm -Rf app/cache/*'
alias blainitslotgithook='ssh comtools1 "sudo -u www-data /space/products/comuto3/misc/init-slot-githook.sh"'
alias blainitslot='ssh comtools1 "sudo -u www-data /space/products/comuto3/misc/init-slot2.sh"'
alias blacheckbranches='git br -a --merged | grep -v master | grep -v stable'
alias blaupdatesatis='ssh comtools1 "cd /space/products/composer-packages/satis/ && sudo -u www-data ./bin/satis build packages/comuto3.json www/"'
alias blaconsumev3='ssh vbbcwork1 "sudo -u www-data /space/products/comuto3/prod/app/console blablacar:worker:consume --env=prod --no-debug --max-messages=10"'
alias blaconsumemailworker='ssh vbbcwork1 "sudo -u www-data /space/products/mail-worker/prod/console consume --max-messages=100"'
alias blaconsumesmsworker='ssh vbbcwork1 "sudo -u www-data /space/products/smsworker/prod/smsworker consume --max-messages=100"'
alias blaconsumeconsole='ssh vbbcwork1 "sudo -u www-data /space/products/console/prod/console indexer:consume --max-messages=1000"'
alias blacroncheck='redis-cli -h vbbcredis2.short -n 3 KEYS "cron:*"'
alias blacronclean='blacroncheck | xargs -n 30 redis-cli -h pmk-redis-write -n 3 DEL'
alias blaindextripoffer='ssh vbbcwork1 "sudo -u www-data /space/products/console/prod/console pu:tr --id="'
alias blaindexmember='ssh vbbcwork1 "sudo -u www-data /space/products/console/prod/console pu:member --id="'
alias blaupdatemisc='ssh comtools1 "cd /space/products/misc && sudo -u www-data git pull && sudo -u www-data make clean all"'
alias gov3='cd /space/products/bbcthree/comuto3'
alias goworkers='cd /space/products/workers'
alias godomain='cd /space/products/domain/all'
alias gochef='cd /space/products/chef/chef'

# EC2
function aws-sts-decode-authorization-message {
    aws sts decode-authorization-message --encoded-message $1 | sed 's/\\//g' | sed 's/"{"/{"/' | sed 's/}}}"/}}}/'
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
