#!/bin/bash

yum -y install git
rpm -i /vagrant/resources/jdk-7u51-linux-x64.rpm
mkdir -p /usr/local/stash
tar -zxvf /vagrant/resources/atlassian-stash-2.10.1.tar.gz -C /usr/local/stash
