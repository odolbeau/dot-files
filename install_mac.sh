#!/bin/bash

# Need to download:
# https://xquartz.macosforge.org/landing/
# Then brew install cairo py2cairo

mkdir -p ~/Library/LaunchAgents
brew install git wget autoconf bash coreutils ack bash-completion ruby python watch go

# Applications
brew install vim --override-system-vi
brew install macvim
brew linkapps
brew tap phinze/cask
brew install brew-cask
brew cask install dropbox google-chrome iterm2 launchrocket pandoc sequel-pro slack spectacle vagrant virtualbox

pip install pjson
pip install elasticsearch-curator

brew tap homebrew/dupes
brew tap homebrew/php
brew install php56 --with-fpm --with-imap --with-homebrew-curl --with-homebrew-libxslt --without-snmp
brew install php56-amqp php56-mcrypt php56-memcached php56-redis php56-yaml php56-apcu php56-twig phpunit

# Update PHP Conf
echo "memory_limit = 2048M" >> /usr/local/etc/php/5.6/php.ini
echo "post_max_size = 16M" >> /usr/local/etc/php/5.6/php.ini
echo "upload_max_filesize = 16M" >> /usr/local/etc/php/5.6/php.ini
echo "date.timezone = 'Europe/Paris'" >> /usr/local/etc/php/5.6/php.ini
echo "phar.readonly = Off" >> /usr/local/etc/php/5.6/php.ini

brew install composer node mysql nginx redis maven graphviz elasticsearch fswatch curl tree php-cs-fixer gecode php-cs-fixer
npm install -g grunt-cli
npm install -g bower
rm /usr/local/Cellar/mysql/*/my.cnf

# autocompletion
brew tap homebrew/completions
brew install vagrant-completion

# Others
sudo gem update --system
sudo gem pristine --all --only-executables
sudo gem install bundler
bundle install
pip install json carbon whisper
