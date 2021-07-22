#!/bin/bash
#
# Script to Install linux system tools and basic python components
# as well as start Jupyter Lab Server
#
# General Linux
apt-get update		# updates the pacakge index cache
apt-get upgrade -y	# updates packages
# install system tools
apt-get install -y build-essential git		# system tools
apt-get install -y screen htop vim wget		# system tools
apt-get upgrade -y bash		# upgrades bash if necessary
apt-get clean		# cleans up the package index cache

# installing miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O Miniconda.sh
bash Miniconda.sh -b		# installs miniconda
rm -rf Miniconda.sh		# removes the installer
# prepends the new path for current session
export PATH="/root/miniconda3/bin:$PATH"
# prepends the new path in the shell configuration
cat >> ~/.profile <<EOF
export PATH="/root/miniconda3/bin:$PATH"
EOF

# installing python libraries
conda install -y jupyter	# interactive data analytics in the browser
conda install -y jupyterlab	# jupyter lab environment
conda install -y numpy		# numerical computing package
conda install -y pytables   # wrapper for HDFS binary storage
conda install -y pandas     # data analysis package
conda install -y scipy      # scientific computations package
conda install -y matplotlib # standard plotting library
conda install -y seaborn    # statistical plotting library
conda install -y quandl     # wrapper for Quandl data API
conda install -y scikit-learn   # machine learning library
conda install -y openpyxl   # package for excel interaction
conda install -y xlrd xlwt  # packages for excel interaction
conda install -y pyyaml     # package to manage yaml files

pip install --upgrade pip   # upgrading the package manager
pip install q               # logging and debugging
pip install plotly          # interactive D3.js plots
pip install cufflinks       # combining plotly with pandas
pip install tensorflow      # deep learning library
pip install keras           # deep learning library
pip install eikon           # python wrapper for the reinitiv eikon data api
# python wrapper for Oanda API
pip install git+git://github.com/yhilpisch/tpqoa

# copying files and creating directories
mkdir -p /root/.jupyter/custom
wget http://hilpisch.com/custom.css
mv custom.css /root/.jupyter/custom
mv /root/jupyter_notebook_config.py /root/.jupyter/
mv /root/mycert.pem /root/.jupyter
mv /root/mykey.key /root/.jupyter
mkdir /root/notebook
cd /root/notebook

# starting jupyter lab
jupyter lab &