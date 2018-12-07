#!/usr/bin/env bash

if [[ ("$#" -ne 1) ]]; then
    echo "Usage: $0 play/pause/next/prev/toggle"
    exit 1
fi

if [[ !($(pidof spotify)) ]]; then
    echo "Spotify is not running"
    exit 1
fi

if [[ $1 == "play" ]]; then
    dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Play
elif [[ $1 == "pause" ]]; then
    dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Pause
elif [[ $1 == "next" ]]; then
    dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next
elif [[ $1 == "prev" ]]; then
    dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous
elif [[ $1 == "toggle" ]]; then
    dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause
else
    echo "Usage: $0 play/pause/next/prev/toggle"
    exit 1
fi

exit 0
