#!/bin/sh

THEMEDIR=$HOME"/.config/awesome/themes/blue-black-red-2"

awsetbg "$THEMEDIR"/background.jpg
killall idesk
killall conky
conky -d -c "$HOME"/.conkyrc &
conky -d -c "$HOME"/.config/conky/arch/paconky.ck &
conky -d -c "$HOME"/.config/conky/arch/messages.ck &
conky -d -c "$HOME"/.config/conky/conky_grey/conkyrc_grey &
idesk &
exit 0
