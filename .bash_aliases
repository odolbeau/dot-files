# ls aliases
alias ll='ls -lh'
alias la='ls -ahl'
alias v='mvim'

# reload
alias rl_es='launchctl unload ~/Library/LaunchAgents/blablacar.elasticsearch.plist && launchctl load ~/Library/LaunchAgents/blablacar.elasticsearch.plist'
alias rl_indexer='launchctl unload ~/Library/LaunchAgents/blablacar.indexer.plist && launchctl load ~/Library/LaunchAgents/blablacar.indexer.plist'
alias rl_fpm='launchctl unload ~/Library/LaunchAgents/homebrew-php.josegonzalez.php54.plist && launchctl load ~/Library/LaunchAgents/homebrew-php.josegonzalez.php54.plist'
alias rl_redis='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist'
alias rl_mysql='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist'

# Others
alias tags='ctags -f tags -h ".php" -R --exclude=".svn" --exclude="*.sql" --exclude="*/cache/**" --exclude="*.min.js" --totals=yes --tag-relative=yes --PHP-kinds=+cf --fields=+afkst --regex-PHP="/@method[ ][^ ]+[ ]+([^ (]*)/\1/f/"'
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias count_mysql_connections='mysql -NBe "show processlist;"'

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
alias sfpu='phpunit -c app'
alias sfpus='phpunit -c app --stop-on-failure'
alias sfpuf='phpunit -c app --filter'
alias sfpud='phpunit -c app --debug'
alias phpcsfixer='php-cs-fixer fix src/ --fixers=indentation,trailing_spaces,unused_use,php_closing_tag,return,braces,phpdoc_params,eof_ending,extra_empty_lines,include,controls_spaces,elseif'
alias sfcd='php app/console container:debug'
alias sfcdg='sfcd | grep'

# BlaBlaCar
alias blatail='tail -f app/logs/*.log app/logs/*/*/*.log /tmp/v3worker_*.log'
alias blatrans='php app/console blablacar:translation:update --force; php app/console blablacar:translation:update; rm -Rf app/cache/*'
alias blainitslotgithook='ssh comtools1 "sudo -u www-data /space/products/comuto3/misc/init-slot-githook.sh"'
alias blainitslot='ssh comtools1 "sudo -u www-data /space/products/comuto3/misc/init-slot2.sh"'
alias blacheckbranches='git br -a --merged | grep -v master | grep -v stable'
alias blaupdatesatis='ssh comtools1 "cd /space/products/composer-packages/satis/ && sudo -u www-data ./bin/satis build packages/comuto3.json www/"'

# Usage: find ... | delete_trailing_spaces
function delete_trailing_spaces {
    xargs perl -pi -e 's/[ ]*$//'
}

# Display number of lines & files.
# Usage: find ... | print_stats
function print_stats {
    xargs -L 1 wc -l | awk '{l+=$0} {f+=1} END {print "lines: " l} END {print "files: " f}'
}
