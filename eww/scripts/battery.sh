#!/usr/bin/env bash

c=$(cat /sys/class/power_supply/BAT0/capacity)
s=$(cat /sys/class/power_supply/BAT0/status)

icon() {
if [ "$c" -eq 100 ]; then
	echo "󰂄"
elif [ "$c" -le 10 ]; then
	echo "󰁺"
elif [ "$c" -le 20 ]; then
	echo "󰁻"
elif [ "$c" -le 30 ]; then
	echo "󰁼"
elif [ "$c" -le 40 ]; then
	echo "󰁽"
elif [ "$c" -le 50 ]; then
	echo "󰁾"
elif [ "$c" -le 60 ]; then
	echo "󰁿"
elif [ "$c" -le 70 ]; then
	echo "󰂀"
elif [ "$c" -le 80 ]; then
	echo "󰂁"
elif [ "$c" -le 90 ]; then
	echo "󰂂"
elif [ "$c" -le 99 ]; then
	echo "󱧥"
else
	echo "󰂃"
fi
}

[ "$1" = "-i" ] && icon && exit
[ "$1" = "-p" ] && cat /sys/class/power_supply/BAT0/capacity && exit
exit
