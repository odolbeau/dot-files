#!/bin/bash

# Need to download:
# https://xquartz.macosforge.org/landing/
# Then brew install cairo py2cairo

xcode-select --install

# Don't lose WIFI when locking screen
sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport en0 prefs DisconnectOnLogout=NO

mkdir -p ~/Library/LaunchAgents
brew install git wget autoconf bash coreutils ack bash-completion ruby python watch go phpunit

# Applications
brew install vim --override-system-vi
brew install macvim
brew linkapps
brew tap phinze/cask
brew install brew-cask
brew cask install dropbox google-chrome iterm2 launchrocket onepassword pandoc sequel-pro slack spectacle vagrant virtualbox

brew tap homebrew/dupes
brew tap homebrew/php
brew install php56 --with-fpm --with-imap --with-homebrew-openssl --with-homebrew-curl --with-homebrew-libxslt --without-snmp
brew install php56-amqp php56-mcrypt php56-memcached php56-redis php56-yaml php56-apcu php56-twig
brew install composer node mysql nginx redis maven graphviz elasticsearch fswatch curl tree php-cs-fixer gecode
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

# Update PHP Conf
echo "memory_limit = 2048M" >> /usr/local/etc/php/5.6/php.ini
echo "post_max_size = 16M" >> /usr/local/etc/php/5.6/php.ini
echo "upload_max_filesize = 16M" >> /usr/local/etc/php/5.6/php.ini
echo "date.timezone = 'Europe/Paris'" >> /usr/local/etc/php/5.6/php.ini
