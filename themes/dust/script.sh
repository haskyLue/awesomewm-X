#!/bin/bash

THEMEDIR=$HOME"/.config/awesome/themes/dust"

killall conky
killall idesk
if grep -q "wp" <<<$@; then
    awsetbg "$THEMEDIR"/background.jpg
fi
if grep -q "conky" <<<$@; then
    conky -d -c "$HOME"/.config/conky/.conkyrc &
fi
if grep -q "eng" <<<$@; then
    conky -d -c "$HOME"/.config/conky/conky_grey/conkyrc_grey &
fi
if grep -q "email" <<<$@; then
    conky -d -c "$HOME"/.config/conky/arch/messages.ck &
fi
if grep -q "archlinux" <<<$@; then
    conky -d -c "$HOME"/.config/conky/arch/paconky.ck &
fi
if grep -q "idesk" <<<$@; then
    idesk &
fi
exit 0