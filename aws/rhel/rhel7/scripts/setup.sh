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

echo ++ Installing Docker

# Install yum-utils
sudo yum install -y yum-utils

# Enable extras repo
sudo yum-config-manager --enable rhel-7-server-rhui-extras-rpms

# Check that repo was enabled
sudo yum repolist enabled

# Add Docker repo
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker engine and containerd
sudo yum install -y docker-ce docker-ce-cli containerd.io

echo ++++ DONE ++++
