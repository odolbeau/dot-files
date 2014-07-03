#!/bin/bash

# Need to download:
# https://xquartz.macosforge.org/landing/
# Then brew install cairo py2cairo

xcode-select --install

mkdir -p ~/Library/LaunchAgents
brew install git wget autoconf bash coreutils ack bash-completion ruby python watch go
brew tap homebrew/dupes
brew tap homebrew/php
brew install php55 --with-fpm --with-imap --with-homebrew-openssl --with-homebrew-curl --with-homebrew-libxslt
brew install php55-intl php55-amqp php55-mcrypt php55-memcached php55-redis php55-yaml
brew install composer node mysql nginx redis maven graphviz elasticsearch fswatch curl tree
npm install -g grunt-cli
npm install -g bower
rm /usr/local/Cellar/mysql/*/my.cnf

# Need older version of gecode
cd $( brew --prefix )
git checkout 3c5ca25 Library/Formula/gecode.rb
brew install gecode
git checkout -- Library/Formula/gecode.rb

# Launch all
brew services start elasticsearch
brew services start php55
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
brew cask install adium dropbox google-chrome iterm2 launchrocket onepassword pandoc sequel-pro slack spectacle vagrant virtualbox

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
echo "memory_limit = 2048M" >> /usr/local/etc/php/5.5/php.ini
echo "post_max_size = 16M" >> /usr/local/etc/php/5.5/php.ini
echo "upload_max_filesize = 16M" >> /usr/local/etc/php/5.5/php.ini
echo "date.timezone = 'Europe/Paris'" >> /usr/local/etc/php/5.5/php.ini
