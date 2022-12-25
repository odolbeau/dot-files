# ls aliases
alias ls='ls --color'
alias ll='ls -lh'
alias la='ls -ahl'
alias v='terminator --working-directory `pwd` -bmue vim & > /dev/null 2>&1'

alias fuck='sudo $(history -p \!\!)'
alias apt-upgrade-all='sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove --purge -y && calibre-upgrade && joplin-upgrade'
alias calibre-upgrade='sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin'
alias joplin-upgrade='wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash'
alias myip='ip --color --brief addr show'

# Folders
alias ..="cd .."

# reload
alias rl_profile='source ~/.bashrc'

# Others
alias count_mysql_connections='watch -n 1 "mysql -uroot -e \"show processlist;\" | wc -l"'
alias mkcd='_(){ mkdir -p $1; cd $1; }; _'
alias flactomp3='parallel ffmpeg -i {} -vcodec copy -vsync 2 -map a -codec:a libmp3lame -qscale:a 2 {.}.mp3'
alias cleanmp3='parallel "ffmpeg -i {} -map a -codec:a libmp3lame -qscale:a 2 /tmp/{/} && mv /tmp/{/} {}"'
alias check_website_certificate='_(){ echo | openssl s_client -showcerts -servername $1 -connect $1:443 2>/dev/null | openssl x509 -inform pem -noout -text; }; _'
alias syslog='sudo journalctl --system -f -p 5 -n 100'

# Git
alias g='git'
alias gl='git l'
alias gf='git f'
alias gfmm='git f && git merge origin/main'
alias gfrm='git f && git rebase origin/main'
alias gfr='git f && git rebase '
alias gp='git pull'

# Docker
alias dc='docker-compose'
alias dcu='dc up -d --remove-orphans --no-recreate'
alias drmif='docker images | awk '"'"'{ print $3 }'"'"' | xargs -n 10 docker rmi -f'
alias phpqa='docker run --init -it --rm -v "$(pwd):/project" -v "$(pwd)/tmp-phpqa:/tmp" -w /project jakzal/phpqa:alpine'

# PHP / Symfony
alias scc='rm -Rf var/cache/*'
alias sf='php bin/console'
alias phpsessionclear='sudo ls -1 /var/lib/php/sessions/ | xargs -I {} rm /var/lib/php/sessions/{}'

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
