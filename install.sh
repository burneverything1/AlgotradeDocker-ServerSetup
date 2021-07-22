#!/bin/bash
#
# Script to Install Linux System Tools and Basic Python Components
#
# General Linux
apt-get update # updates the package index cache
apt-get upgrade -y # updates packages
# installs system tools
apt-get install -y bzip2 gcc git  # system tools
apt-get install -y htop screen vim wget  # system tools
apt-get upgrade -y bash  # upgrades bash if necessary
apt-get clean  # cleans up the pcakage index cache
#
# install Miniconda
# downloads miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O Miniconda.sh
bash Miniconda.sh -b # installs it
rm -rf Miniconda.sh # removes installer
export PATH="/root/miniconda3/bin:$PATH"  # prepends the new path
#
# install python libraries
conda install -y pandas # install pandas
conda install -y ipython # installs ipython shell
#
# customization
cd /root/
