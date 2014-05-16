#!/bin/bash

xcode-select --install

mkdir -p ~/Library/LaunchAgents
brew install git wget autoconf bash coreutils ack bash-completion ruby python watch
brew tap homebrew/dupes
brew tap homebrew/php
brew install php54 --with-fpm --with-imap --with-homebrew-openssl
brew install php54-intl php54-amqp php54-apc php54-mcrypt php54-memcached php54-redis php54-yaml
brew install composer node mysql nginx redis maven graphviz elasticsearch fswatch curl tree
npm install -g grunt-cli
npm install -g bower
rm /usr/local/Cellar/mysql/*/my.cnf

# Launch all
brew services start elasticsearch
brew services start php54
brew services start mysql
brew services start redis
brew services start memcached
brew services start rabbitmq
sudo brew services start nginx

# Applications
brew install vim --override-system-vi
brew install macvim
brew linkapps
brew tap phinze/cask
brew install brew-cask
brew cask install adium dropbox launchrocket pandoc sequel-pro slack spectacle

# Others
sudo gem update --system
sudo gem pristine --all --only-executables
sudo gem install bundler
bundle install
pip install json

# Update PHP Conf
echo "memory_limit = 2048M" >> /usr/local/etc/php/5.4/php.ini
echo "post_max_size = 16M" >> /usr/local/etc/php/5.4/php.ini
echo "upload_max_filesize = 16M" >> /usr/local/etc/php/5.4/php.ini
echo "date.timezone = 'Europe/Paris'" >> /usr/local/etc/php/5.4/php.ini
