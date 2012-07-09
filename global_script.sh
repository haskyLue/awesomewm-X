#!/bin/bash


killall conky
killall idesk

if grep -q "wp" <<<$@; then
    awsetbg "$HOME"/.config/awesome/global_wallpaper.jpg
    sleep 1
fi
if grep -q "conky" <<<$@; then
    conky -d -c "$HOME"/.config/conky/.conkyrc &
    sleep 1
fi
if grep -q "eng" <<<$@; then
    conky -d -c "$HOME"/.config/conky/conky_grey/conkyrc_grey &
    sleep 1
fi
if grep -q "email" <<<$@; then
    conky -d -c "$HOME"/.config/conky/arch/messages.ck &
    sleep 1
fi
if grep -q "archlinux" <<<$@; then
    conky -d -c "$HOME"/.config/conky/arch/paconky.ck &
    sleep 1
fi
if grep -q "idesk" <<<$@; then
    idesk &
fi
exit 0