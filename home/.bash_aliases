alias v='terminator --working-directory `pwd` -bmue vim & > /dev/null 2>&1'

alias fuck='sudo $(history -p \!\!)'
alias apt-upgrade-all='sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove --purge -y && sudo snap refresh && calibre-upgrade'
alias calibre-upgrade='sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin'

# Others
alias count_mysql_connections='watch -n 1 "mysql -uroot -e \"show processlist;\" | wc -l"'
alias flactomp3='parallel ffmpeg -i {} -vcodec copy -vsync 2 -map a -codec:a libmp3lame -qscale:a 2 {.}.mp3'
alias cleanmp3='parallel "ffmpeg -i {} -map a -codec:a libmp3lame -qscale:a 2 /tmp/{/} && mv /tmp/{/} {}"'
alias check_website_certificate='_(){ echo | openssl s_client -showcerts -servername $1 -connect $1:443 2>/dev/null | openssl x509 -inform pem -noout -text; }; _'
alias syslog='sudo journalctl --system -f -p 5 -n 100'

# Git
alias g='git'
complete -F _complete_alias g
alias gl='git l'
alias gf='git f'
alias gfmm='git f && git merge origin/main'
alias gfrm='git f && git rebase origin/main'
alias gfr='git f && git rebase '
alias gp='git pull'

# PHP
alias scc='rm -Rf var/cache/*'
alias phpqa='docker run --init -it --rm -v "$(pwd):/project" -v "$(pwd)/tmp-phpqa:/tmp" -w /project jakzal/phpqa:alpine'
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

function sf() {
    RETURN=$(dce exec php bin/console "$@")
    if [ "$RETURN" == 1 ]; then
        RETURN=$(php bin/console "$@")
    fi

    return "$RETURN"
}

alias at_bookstack_backup='scp altercampagne_cloud:/home/admin/nextcloud/var/bookstack-backups/backup-$(date +%F)_01-00.tar.gz ~/Nextcloud/apps/altercampagne/bookstack-backup-$(date +%F)_01-00.tar.gz'

# Clone a repo like a boss!
function clone() {
  if [ "$#" -ne 1 ]; then
    echo "USAGE: clone author/repo"
  fi

  # Move to where forks live and clone the original repo.
  cd /space/forks
  mkcd $(echo $1 | sed 's/\/.*//')
  git clone git@github.com:${1}.git

  # Strip the "author/" prefix from "author/repo" for the directory name
  cd $(echo $1 | sed 's/.*\///')
}
