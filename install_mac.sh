#!/bin/bash

mkdir -p ~/Library/LaunchAgents
brew install git wget autoconf bash coreutils ack
brew tap homebrew/dupes
brew tap josegonzalez/homebrew-php
brew install php54 --with-fpm --with-imap --with-homebrew-openssl
ln -sfv /usr/local/opt/php54/*.plist ~/Library/LaunchAgents
brew install php54-intl php54-amqp php54-apc php54-mcrypt php54-memcached php54-redis php54-yaml composer node mysql nginx redis maven graphviz elasticsearch fswatch
ln -sfv /usr/local/opt/rabbitmq/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.rabbitmq.plist
ln -sfv /usr/local/opt/memcached/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist
npm install -g grunt-cli
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
rm /usr/local/Cellar/mysql/*/my.cnf
ln -sfv /usr/local/opt/nginx/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist
ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
ln -sfv /usr/local/opt/elasticsearch/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.elasticsearch.plist

# Applications
brew install vim --override-system-vi
brew install macvim
brew linkapps
brew tap phinze/cask
brew install brew-cask
brew cask install adium dropbox pandoc sequel-pro slack spectacle

curl -L https://www.opscode.com/chef/install.sh | sudo bash

# Others
#sudo gem install compass

# Update PHP Conf
echo "memory_limit = 2048M" >> /usr/local/etc/php/5.4/php.ini
echo "post_max_size = 16M" >> /usr/local/etc/php/5.4/php.ini
echo "upload_max_filesize = 16M" >> /usr/local/etc/php/5.4/php.ini
echo "date.timezone = 'Europe/Paris'" >> /usr/local/etc/php/5.4/php.ini
