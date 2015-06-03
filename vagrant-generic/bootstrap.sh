#!/bin/sh

PUPPET_DIR='/opt/puppet-provision'
VAGRANT_DIR='/vagrant'
RUBY_MAJOR_VERSION='2'
RUBY_MINOR_VERSION='2'
RUBY_MICRO_VERSION='2'
PUPPET_VERSION='4.1.0'
LIBRARIAN_PUPPET_VERSION='2.2.0'

#Used internally.  This variable is not intended to be changed.  If the version of Ruby needs to be updated, modify the RUBY_MAJOR_VERSION, RUBY_MINOR_VERSION, or RUBY_MICRO_VERSION variables.
RUBY_VERSION=$RUBY_MAJOR_VERSION'.'$RUBY_MINOR_VERSION'.'$RUBY_MICRO_VERSION

apt-get update

echo "Installing dependencies for puppet support"
apt-get install -y -q gcc git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev tofrodos
sleep 4
echo "Building Ruby $RUBY_VERSION from source..."
wget http://ftp.ruby-lang.org/pub/ruby/$RUBY_MAJOR_VERSION'.'$RUBY_MINOR_VERSION/ruby-$RUBY_VERSION.tar.gz
tar -xzvf ruby-$RUBY_VERSION.tar.gz
cd ruby-$RUBY_VERSION/
./configure
make
sudo make install

echo "Installng puppet($PUPPET_VERSION) and librarian-puppet($LIBRARIAN_PUPPET_VERSION) gems"
gem install puppet -v $PUPPET_VERSION
gem install librarian-puppet -v $LIBRARIAN_PUPPET_VERSION
gem install ruby-augeas

fromdos $VAGRANT_DIR/puppet-refresh.sh

sudo chown -R vagrant /opt

mkdir $PUPPET_DIR

cp -r $VAGRANT_DIR/* $PUPPET_DIR/

cd $PUPPET_DIR && librarian-puppet install --verbose

puppet apply -vv  --modulepath=$PUPPET_DIR/modules/ $PUPPET_DIR/manifests/default.pp