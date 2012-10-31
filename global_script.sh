#!/bin/bash

killall conky
#killall idesk
sleep 1
conky -d -c "$HOME"/.config/conky/.conkyrw &
sleep 1
conky -d -c "$HOME"/.config/conky/.conkyweather &
sleep 1
conky -d -c "$HOME"/.config/conky/distro/archlinux/distro.ck &
sleep 1
exit 0