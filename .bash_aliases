# ls aliases
alias ll='ls -lh'
alias la='ls -ahl'
alias v='mvim'

alias tags='ctags -f tags -h ".php" -R --exclude=".svn" --exclude="*.sql" --exclude="*/cache/**" --exclude="*.min.js" --totals=yes --tag-relative=yes --PHP-kinds=+cf --fields=+afkst --regex-PHP="/@method[ ][^ ]+[ ]+([^ (]*)/\1/f/"'

# sf2
alias scc='php app/console cache:clear'
alias sccp='scc --env=prod'
alias scct='scc --env=test'
alias sfassets='php app/console assets:install web'
alias sfdoctrinerebuild='php app/console doctrine:database:drop --force; php app/console doctrine:database:create; php app/console doctrine:schema:create'

# Usage: find ... | delete_trailing_spaces
function delete_trailing_spaces {
    xargs perl -pi -e 's/[ ]*$//'
}

# Display number of lines & files.
# Usage: find ... | print_stats
function print_stats {
    xargs -L 1 wc -l | awk '{l+=$0} {f+=1} END {print "lines: " l} END {print "files: " f}'
}
