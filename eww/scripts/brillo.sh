#!/usr/bin/env bash
# Author : rxyhn

BRIGHTNESS_STEPS=5

if [ -f /tmp/brillo.txt ]; then
	id=$(cat /tmp/brillo.txt | tr -cd '0-9')
	reemplazar="-r $id"
else
	reemplazar=""
fi

function get_brightness {
	brightnessctl i | grep -oP '\(\K[^%\)]+'
}

function send_notification {
  brightness=$(get_brightness)
  # Make the bar with the special character ─ (it's not dash -)
  # https://en.wikipedia.org/wiki/Box-drawing_character
  bar=$(seq -s "─" 0 $((brightness / 5)) | sed 's/[0-9]//g')
  # Send the notification
  fyi -p -i $HOME/.config/eww/scripts/images/brightness.svg -H int:value:$(($brightness)) $reemplazar "Brillo del monitor 0" "$brightness%" > /tmp/brillo.txt
}

case $1 in
  up)
    # increase the backlight by 5%
    brightnessctl set "${BRIGHTNESS_STEPS:-5}%+" -q
    send_notification
    ;;
  down)
    # decrease the backlight by 5%
    brightnessctl set "${BRIGHTNESS_STEPS:-5}%-" -q
    send_notification
    ;;
	-i)
		echo "scripts/images/brightness.svg"
		;;
	-b)
		brightnessctl -m | awk -F, '{print $4}'
		;;
esac
