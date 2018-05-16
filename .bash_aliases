# ls aliases
alias ls='ls --color'
alias ll='ls -lh'
alias la='ls -ahl'
alias v='gvim'

alias fuck='sudo $(history -p \!\!)'
alias apt-upgrade-all='sudo apt update && sudo apt upgrade && sudo apt dist-upgrade && sudo apt autoremove --purge'

# Folders
alias ..="cd .."

# reload
alias rl_profile='source ~/.bashrc'

# Others
alias count_mysql_connections='watch -n 1 "mysql -uroot -e \"show processlist;\" | wc -l"'
alias mkcd='_(){ mkdir -p $1; cd $1; }; _'
alias flactomp3='parallel ffmpeg -i {} -vcodec copy -vsync 2 -map a -codec:a libmp3lame -qscale:a 2 {.}.mp3'
alias cleanmp3='parallel "ffmpeg -i {} -map a -codec:a libmp3lame -qscale:a 2 /tmp/{/} && mv /tmp/{/} {}"'
alias todo='vi ~/Nextcloud/Notes/TODO.txt'
alias check_website_certificate='_(){ echo | openssl s_client -showcerts -servername $1 -connect $1:443 2>/dev/null | openssl x509 -inform pem -noout -text; }; _'

# Git
alias g='git'
alias gf='git f'
alias gfmm='git f && git merge origin/master'
alias gfrm='git f && git rebase origin/master'
alias gfr='git f && git rebase '
alias gp='git pull'

# PHP / Symfony
alias scc='rm -Rf var/cache/*'
alias pu='vendor/bin/phpunit --colors'
alias pus='pu --stop-on-failure'
alias puf='pu --filter'
alias pud='pu --debug'
alias sf='php bin/console'
alias sfcd='sf debug:container --show-private'
alias sfcdg='sfcd | grep'

# Go!
alias gogithub='cd /space/github'
alias gospoted='cd /space/github/spoted'

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
  mkcd $(echo $1 | sed 's/\/.*//')
  git clone git://github.com/${1}.git

  # Strip the "author/" prefix from "author/repo" for the directory name
  cd $(echo $1 | sed 's/.*\///')
}
