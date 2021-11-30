#!/bin/bash
set -x

echo ++ Updating
sudo yum -y update

echo ++ Install Python3.8
sudo yum -y groupinstall 'Development Tools' 
sudo yum -y install openssl-devel bzip2-devel libffi-devel xz-devel
sudo yum -y install wget
wget https://www.python.org/ftp/python/3.8.12/Python-3.8.12.tgz
tar xvf Python-3.8.12.tgz
cd Python-3.8*/
./configure --enable-optimizations
sudo make altinstall
python3.8 -m pip install --upgrade pip

echo ++ Updating PATH
export PATH=/usr/local/bin:$PATH

echo ++ install JQ
sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install -y jq

echo ++ Installing Machine-Stats
python3.8 -m pip install machine-stats

echo ++ Installing Tidal Tools
curl https://get.tidal.sh/unix | bash

echo ++ Installing Nmap
sudo yum install -y nmap

echo ++ whoami
whoami

echo ++++ DONE ++++