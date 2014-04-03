#!/bin/bash

mkdir -p ~/Library/LaunchAgents
brew install git wget autoconf bash coreutils ack
brew tap homebrew/dupes
brew tap josegonzalez/homebrew-php
brew install php54 --with-fpm --with-imap --with-homebrew-openssl
ln -sfv /usr/local/opt/php54/*.plist ~/Library/LaunchAgents
brew install php54-intl php54-amqp php54-apc php54-mcrypt php54-memcached php54-redis php54-yaml composer node mysql nginx redis maven graphviz elasticsearch
ln -sfv /usr/local/opt/rabbitmq/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.rabbitmq.plist
ln -sfv /usr/local/opt/memcached/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist
npm install -g grunt-cli
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
ln -sfv /usr/local/opt/nginx/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist
ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
ln -sfv /usr/local/opt/elasticsearch/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.elasticsearch.plist
sudo gem install compass
