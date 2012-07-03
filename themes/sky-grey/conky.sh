#!/bin/sh

THEMEDIR=$HOME"/.config/awesome/themes/sky-grey"

awsetbg "$THEMEDIR"/background.png
killall idesk
killall conky
conky -d -c "$HOME"/.conkyrc &
conky -d -c "$HOME"/.config/conky/arch/paconky.ck &
conky -d -c "$HOME"/.config/conky/arch/messages.ck &
conky -d -c "$HOME"/.config/conky/conky_grey/conkyrc_grey &
idesk &
exit 0
