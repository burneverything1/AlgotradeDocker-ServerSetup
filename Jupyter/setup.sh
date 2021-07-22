#!/bin/bash
#
# Setting up DigitalOcean droplet with Basic Python Stack and Jupyter Notebook
#
# IP ADDRESS FROM PARAMETER
MASTER_IP=$1

# copying the files
scp install.sh root@${MASTER_IP}:
scp mycert.pem mykey.key jupyter_notebook_config.py root@${MASTER_IP}:

# executin the installation script
ssh root@${MASTER_IP} bash /root/install.sh