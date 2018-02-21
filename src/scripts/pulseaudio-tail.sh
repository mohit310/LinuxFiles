#!/bin/sh

sink=0

volume_up() {
#    pactl set-sink-volume $sink +1%
    pamixer --sink $sink -i 20000
}

volume_down() {
#    pactl set-sink-volume $sink -1%
    pamixer --sink $sink -d 20000
}

volume_mute() {
    pamixer --sink $sink -t
}

volume_print() {
    muted=$(pamixer --sink $sink --get-mute)

    if [ "$muted" = true ]; then
        echo "%{F#f00}M: --%{F-}"
    else
        volume=$(pamixer --sink $sink --get-volume)

        if [ "$volume" -lt 50 ]; then
            echo "%{F#1f0}L: $volume %%{F-}"
		elif [ "$volume" -gt 50 ] && [ "$volume" -lt 100 ]; then
			echo "%{F#ef0}L: $volume %%{F-}"
        else
            echo "%{F#f00}H: $volume %%{F-}"
        fi
    fi
}

listen() {
    volume_print

    pactl subscribe | while read -r event; do
        if echo "$event" | grep -q "#$sink"; then
            volume_print
        fi
    done
}

case "$1" in
    --up)
        volume_up
        ;;
    --down)
        volume_down
        ;;
    --mute)
        volume_mute
        ;;
    *)
        listen
        ;;
esac
