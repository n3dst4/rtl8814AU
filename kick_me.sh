#!/usr/bin/env bash
mkdir ./logs
echo >> ./logs/kick_me.log
date >> ./logs/kick_me.log
echo "Running rtl8814AU/kick_me.sh for kernel version:" >> ./logs/kick_me.log
uname -a >> ./logs/kick_me.log

sudo dkms remove rtl8814au/4.3.21 --all
sudo dkms install -m rtl8814au -v 4.3.21
