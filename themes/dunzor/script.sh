#!/bin/bash

THEMEDIR=$HOME"/.config/awesome/themes/dunzor"

killall conky
#killall idesk
sleep 1
if grep -q "wp" <<<$@; then
    awsetbg "$THEMEDIR"/background.jpg
    sleep 1
fi
# if grep -q "conky" <<<$@; then
#     conky -d -c "$HOME"/.config/conky/.conkyrc &
#     sleep 1
# fi
# if grep -q "eng" <<<$@; then
#     conky -d -c "$HOME"/.config/conky/conky_grey/conkyrc_grey &
#     sleep 1
# fi
# if grep -q "email" <<<$@; then
#     conky -d -c "$HOME"/.config/conky/email/messages.ck &
#     sleep 1
# fi
# if grep -q "archlinux" <<<$@; then
#     conky -d -c "$HOME"/.config/conky/distro/archlinux/distro.ck &
#     sleep 1
# fi
# if grep -q "gentoo" <<<$@; then
#     conky -d -c "$HOME"/.config/conky/distro/gentoo/distro.ck &
#     sleep 1
# fi
# if grep -q "debian" <<<$@; then
#     conky -d -c "$HOME"/.config/conky/distro/debian/distro.ck &
#     sleep 1
# fi
# if grep -q "fedora" <<<$@; then
#     conky -d -c "$HOME"/.config/conky/distro/fedora/distro.ck &
#     sleep 1
# fi
# if grep -q "idesk" <<<$@; then
#     idesk &
# fi
conky -d -c "$HOME"/.config/conky/.conkyrw &
sleep 1
conky -d -c "$HOME"/.config/conky/.conkyweather &
sleep 1
conky -d -c "$HOME"/.config/conky/distro/archlinux/distro.ck &
sleep 1
exit 0