#!/usr/bin/env bash

exec >> $HOME/.xkeysnail/stdout.log 2>&1

xhost +SI:localuser:xkeysnail
sudo -u xkeysnail DISPLAY=$DISPLAY /usr/local/bin/xkeysnail --watch $HOME/.xkeysnail/config.py &
