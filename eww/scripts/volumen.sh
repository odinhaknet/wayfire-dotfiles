#!/bin/bash

get_vol () {
    volumen=$(pamixer --get-volume-human | tr -d '%')
    [[ $volumen == 'muted' ]] && echo "0" || echo "${volumen}"
}

get_icon () {
    vol=$(get_vol)
    echo "scripts/images/$( [[ $vol == "0" ]] && echo "mute" || echo "volume" ).png"
}

case "$1" in
    -v) get_vol ;;
    -i) get_icon ;;
esac

