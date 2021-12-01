#!/bin/bash
set -x

echo ++ Updating
sudo yum -y update

echo ++ Install Python36
sudo yum install -y python36
sudo pip3 install --upgrade pip

echo ++ Updating PATH
export PATH=/usr/local/bin:$PATH

echo ++ install JQ
sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install -y jq

echo ++ Installing Machine-Stats
pip3 install --user machine-stats

echo ++ Installing Tidal Tools
curl https://get.tidal.sh/unix | bash

echo ++ Installing Nmap
sudo yum install -y nmap

echo ++++ DONE ++++
