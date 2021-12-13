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

## Install required CentOS packages
sudo yum -y install http://mirror.centos.org/centos/7/extras/x86_64/Packages/fuse3-libs-3.6.1-4.el7.x86_64.rpm
sudo yum -y install http://mirror.centos.org/centos/7/extras/x86_64/Packages/fuse3-devel-3.6.1-4.el7.x86_64.rpm
sudo yum -y install http://mirror.centos.org/centos/7/extras/x86_64/Packages/fuse-overlayfs-0.7.2-6.el7_8.x86_64.rpm
sudo yum -y install http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.119.2-1.911c772.el7_8.noarch.rpm
sudo yum -y install http://mirror.centos.org/centos/7/extras/x86_64/Packages/slirp4netns-0.4.3-4.el7_8.x86_64.rpm

# Add docker repo and install docker engine and containerd
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io

docker --version

echo ++++ DONE ++++
