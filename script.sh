#!/bin/bash

#install base software
yum -y install git
yum -y install postgresql-server
yum --nogpgcheck localinstall /vagrant/resources/jdk-7u51-linux-x64.rpm

mkdir -p /usr/local/stash
tar -zxvf /vagrant/resources/atlassian-stash-2.10.1.tar.gz -C /usr/local/stash

#configure stash-home
/usr/sbin/useradd --create-home --home-dir /usr/local/stash-home --shell /bin/bash stash
perl -p -i -e 's{#STASH_HOME=""}{STASH_HOME="/usr/local/stash-home/"}' /usr/local/stash/atlassian-stash-2.10.1/bin/setenv.sh

#setup db
service postgresql initdb
service postgresql start
chkconfig postgresql on
su -c "psql -c \"CREATE ROLE stash WITH LOGIN PASSWORD 'stash' VALID UNTIL 'infinity';\"" -s /bin/bash postgres
su -c "psql -c \"CREATE DATABASE stash WITH ENCODING='UTF8' OWNER=stash CONNECTION LIMIT=-1;\"" -s /bin/bash postgres


