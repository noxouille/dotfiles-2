#!/bin/bash

export EDITOR=nvim
xsetroot -solid \#005577

# For BAT : $(cat /sys/class/power_supply/BAT0/capacity)
while true;
do
	xsetroot -name "$(date '+%a, %d %b %H:%M')"
	sleep 1m
done &

exec dwm
