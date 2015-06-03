#!/usr/bin/env bash

echo ==== Installing dependencies ====

apt-get -q -y install lsb-base > /dev/null 2>&1
apt-get -q -y install tofrodos > /dev/null 2>&1
apt-get -q -y install git > /dev/null 2>&1

git config --global merge.tool kdiff3

echo ==== Generating ssh key ====

mkdir ~/.ssh
echo -e 'y\n'|ssh-keygen -q -t rsa -N "" -f ~/.ssh/id_rsa

echo ==== Setting Gradle properties ====

mkdir -p /home/vtdev/.gradle
cp /vagrant/gradle.properties /home/vtdev/.gradle/gradle.properties
chown -R vtdev /home/vtdev/.gradle

mkdir -p /home/vagrant/.gradle
cp /vagrant/gradle.properties /home/vagrant/.gradle/gradle.properties
chown -R vagrant /home/vagrant/.gradle

echo ==== Setting up Proteus utils ====

fromdos /vagrant/proteus_utils/bin/proteus_utils
mkdir -p /usr/lib/proteus_utils
cp -a /vagrant/proteus_utils/. /usr/lib/proteus_utils
chmod 755 /usr/lib/proteus_utils/bin/proteus_utils
ln -s /usr/lib/proteus_utils/bin/proteus_utils /usr/bin/proteus
ln -s /usr/lib/proteus_utils/bin/proteus_utils /usr/bin/proteus_utils

echo ==== Done ====