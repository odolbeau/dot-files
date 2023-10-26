alias v='terminator --working-directory `pwd` -bmue vim & > /dev/null 2>&1'

alias apt-upgrade-all='sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove --purge -y && sudo snap refresh && calibre-upgrade'
alias calibre-upgrade='sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin'

# Others
alias flactomp3='parallel ffmpeg -i {} -vcodec copy -vsync 2 -map a -codec:a libmp3lame -qscale:a 2 {.}.mp3'
alias cleanmp3='parallel "ffmpeg -i {} -map a -codec:a libmp3lame -qscale:a 2 /tmp/{/} && mv /tmp/{/} {}"'
alias syslog='sudo journalctl --system -f -p 5 -n 100'

# Git
alias g='git'
complete -F _complete_alias g
alias gl='git l'
complete -F _complete_alias gl
alias gf='git f'
complete -F _complete_alias gf
alias gfr='git f && git rebase '
complete -F _complete_alias gfr

# PHP
alias scc='rm -Rf var/cache/{dev,test}'
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

# Docker pass-through commands
alias phpqa='docker run --init -it --rm -v "$(pwd):/project" -w /project jakzal/phpqa:alpine'
alias sops='docker run --init -it --rm -v "$(pwd):/project" -w /project mozilla/sops sops'
alias castor='docker run -it --rm -v "$(pwd):/project" -v "/var/run/docker.sock:/var/run/docker.sock:rw" castor'

sf() {
    make -q sf > /dev/null 2>&1
    if [ "$?" -eq 2 ]; then
        if dce ps -q php > /dev/null 2>&1; then
            dce exec php bin/console "$@"
        else
            php bin/console "$@"
        fi
    else
        make sf "$@"
    fi
}
export -f sf

# Clone a repo like a boss!
clone() {
  if [ "$#" -ne 1 ]; then
    echo "USAGE: clone author/repo"
  fi

  # Move to where forks live and clone the original repo.
  mkcd /space/forks/$(echo $1 | sed 's/\/.*//')
  git clone "git@github.com:${1}.git"

  # Strip the "author/" prefix from "author/repo" for the directory name
  cd $(echo $1 | sed 's/.*\///') || exit
}
export -f clone

scw() {
    docker run -it --rm -v "$HOME/.config/scw:/root/.config/scw" scaleway/cli:latest "$@"
}
export -f scw

_scw() {
    _get_comp_words_by_ref -n = cword words

    output=$(docker run -i --rm -v "$HOME/.config/scw:/root/.config/scw" scaleway/cli:latest autocomplete complete bash -- "$COMP_LINE" "$cword" "${words[@]}")
    COMPREPLY=($output)
    # apply compopt option and ignore failure for older bash versions
    [[ $COMPREPLY == *= ]] && compopt -o nospace 2> /dev/null || true
    return
}
complete -F _scw scw
