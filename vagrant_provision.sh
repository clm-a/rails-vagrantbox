#!/bin/bash

sudo apt-get install -y git-core direnv curl build-essential autoconf zlib1g-dev libssl-dev libxml2-dev libreadline6-dev sqlite3 libsqlite3-dev imagemagick libmagickwand-dev libxslt-dev postgresql libpq-dev golang libv8-dev libicu55 libjpeg8 libfontconfig libwebp5 npm nodejs-legacy
sudo su vagrant
echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
if [ ! -d ~/.rbenv ]; then
  git clone git://github.com/sstephenson/rbenv.git ~/.rbenv 
  git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc
  exec $SHELL -l
fi
if [ ! -x "$(bundle -v)" && `ruby -v | awk -F\  '{print $2}' | awk -Fp '{print $1}'` == "2.2.4" ]
  sudo -H -u vagrant bash -i -c 'rbenv install 2.2.3'
  sudo -H -u vagrant bash -i -c 'rbenv rehash'
  sudo -H -u vagrant bash -i -c 'rbenv global 2.2.3'
  sudo -H -u vagrant bash -i -c 'gem install bundler --no-ri --no-rdoc'
  sudo -H -u vagrant bash -i -c 'rbenv rehash'
fi
cd /vagrant
sudo -H -u vagrant bash -i -c 'bundle install'
sudo -H -u vagrant bash -i -c 'rbenv rehash'
direnv allow /var/app
