#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

SSH_PID=$(ps aux | grep "ssh -fN" | grep -v grep | awk '{ print $2 }')

if [ -n "$SSH_PID" ]; then
  UCH_MSG="(FD-OK)"
else
  UCH_MSG="(FD-NG)"
fi

sketchybar --set $NAME label="$UCH_MSG"
