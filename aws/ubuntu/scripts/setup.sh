#!/bin/bash
set -x

echo ++ Updating ++
sudo apt-get update
export DEBIAN_FRONTEND=noninteractive

echo ++ Installing Tidal Tools ++
curl https://get.tidal.sh/unix | bash

echo ++ Installing PIP ++
sudo apt-get install --yes python3-pip

echo ++ Updating PATH ++
export PATH=/home/ubuntu/.local/bin:$PATH

echo ++ Upgrading PIP ++
python3 -m pip install --upgrade pip

echo ++ Python Version?? ++
python3 --version

echo ++ Installing jq ++
sudo apt-get install --yes jq

echo ++ Installing Machine-Stats ++
python3 -m pip install machine-stats

echo ++ Installing Nmap ++
sudo apt-get install --yes  nmap

echo ++++ DONE ++++